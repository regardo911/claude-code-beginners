<!-- Chapter 9: Stripe integration, the manual dashboard steps, the webhook, and the four gotchas (ch09:13-114, 231-248). -->

# Chapter 9: Stripe Prompts

No monthly fee, 2.9% + $0.30 per charge in the US. You pay nothing until you earn something.

```
Add Stripe payment integration to the Task Tracker. Create a pricing page with two tiers: Free (up to 10 tasks, basic features) and Pro ($5/month, unlimited tasks, priority support). Use Stripe Checkout for the payment flow. After successful payment, store the user's subscription status in the database. Pro users should see all features. Free users should see an upgrade prompt when they hit the 10-task limit.
```

Touches the schema, routes, a page and the task-creation logic, so give it medium or high
effort.

## What Claude can't do for you

1. Create a Stripe account at stripe.com (free, five minutes).
2. Copy your test API keys: publishable (`pk_test_`) and secret (`sk_test_`).
3. Create a product named "Task Tracker Pro", price $5/month recurring.
4. Copy the price ID (`price_`).

Those four go in `.env.local`. See `.env.local.stripe.example` in this folder.

Then test checkout: `npm run dev`, open the pricing page, click Upgrade to Pro, and enter
Stripe's test card `4242 4242 4242 4242` with any future expiry, any CVC, any ZIP.

**Checkpoint:** checkout completes, your account shows Pro, the task limit is gone, and the
Stripe dashboard lists a Succeeded test charge.

## The webhook

If the payment succeeds but the redirect fails, the user paid and your app never knew. Claude
creates the handler at `/api/webhooks/stripe`; open the file and confirm the path before you
use it below.

Testing webhooks locally needs the Stripe CLI, a separate tool from the SDK Claude installed:

```
brew install stripe/stripe-cli/stripe
```

On Windows, `winget install Stripe.StripeCLI`. Then:

```
stripe login
```

```
stripe listen --forward-to localhost:3000/api/webhooks/stripe
```

The first run prints a `whsec_` signing secret. Put it in `STRIPE_WEBHOOK_SECRET` and restart
the dev server.

**Checkpoint:** with `stripe listen` running, a test purchase prints `[200]` for each event,
and your database flips the user to Pro from the webhook alone, not from the redirect.

## The four gotchas

**Every event returns `[400]`.** `STRIPE_WEBHOOK_SECRET` doesn't match the secret in the CLI
output. Paste the right one and restart.

**Success redirect works locally, dead link in production.** Claude hardcoded
`localhost:3000`:

```
Make the Stripe Checkout success and cancel URLs use an environment variable for the base URL, not a hardcoded value.
```

**Payment shows in Stripe, database still says free.**

```
The Stripe webhook fires but the user's subscription field isn't updating. Confirm the route is reachable, the event is parsed, and the right user is found and updated.
```

**Free user creates task #11 via the API.** The check is in the UI only:

```
Add the 10-task limit check in the createTask server action, not just the UI. Reject task creation for free users with 10 or more tasks.
```

## Raising the price later

Start low, then raise for new signups and grandfather existing users. In the Stripe
dashboard, add another price at $8.00 monthly, copy the new price ID into
`STRIPE_PRO_PRICE_ID_V2`, restart, then:

```
Point the pricing page and new-signup checkout at STRIPE_PRO_PRICE_ID_V2. Leave existing subscribers on their current price; do not migrate anyone.
```

**Checkpoint:** new checkouts charge $8.00 in test mode, and an already-subscribed test
account keeps its original $5.00.

## Annual

Two months free, $50/year instead of $60, churns less. Add a $50.00 yearly price, put the ID
in `STRIPE_PRO_ANNUAL_PRICE_ID`, restart, then:

```
Add a monthly/annual toggle to the pricing page. Annual is $50/year (2 months free) and uses STRIPE_PRO_ANNUAL_PRICE_ID. Default the toggle to annual and label the savings.
```

## Going live

1. Open `dashboard.stripe.com/apikeys` and flip from test mode to live mode.
2. Copy the live keys (`pk_live_` and `sk_live_`). Stripe reveals the live secret key only
   once, so save it the moment it appears.
3. Update your environment variables on Vercel with the live keys.
4. Update the webhook endpoint to use the live webhook secret.

Taking payments means you need a Terms of Service:

```
Create a basic Terms of Service page for the Task Tracker. It's a SaaS product with monthly subscriptions. Include clauses for account termination, data handling, and limitation of liability.
```

That isn't legal advice. For a real product, talk to a lawyer.
