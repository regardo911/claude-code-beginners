# Chapter 9: Price Tag and Launch

## What you build

A pricing page, a working checkout, a landing page a stranger can find, and five gates before
you tell anyone. The gap between "it works" and "someone paid me" is three things: a page
that explains it, a price, and a button.

## Start here

```
Add Stripe payment integration to the Task Tracker. Create a pricing page with two tiers: Free (up to 10 tasks, basic features) and Pro ($5/month, unlimited tasks, priority support). Use Stripe Checkout for the payment flow. After successful payment, store the user's subscription status in the database. Pro users should see all features. Free users should see an upgrade prompt when they hit the 10-task limit.
```

Four things Claude can't do for you: open the Stripe account, copy the test keys, create the
product, copy the price ID. Those values go in `.env.local`; the shapes are in
`.env.local.stripe.example`.

## Done when

A test purchase with card `4242 4242 4242 4242` flips your account to Pro, and it flips from
the webhook rather than the redirect. Kill the redirect and it should still work: a browser
crash after payment shouldn't leave someone who paid on the free tier.

Then the five gates in `launch-checklist.md`, each a single action with a single pass
condition.

## On your own project

Everything in `stripe-prompts.md` transfers except the tier definitions. Your free limit
won't be ten tasks and your Pro tier won't be $5, so rewrite those two clauses and leave the
rest. The four gotchas transfer exactly, each a symptom with a one-prompt fix.

The revenue table in the book is the author's illustration of what a $5/month product looks
like at 10 and 100 users, not a forecast. Most projects earn nothing. What you walk away with
is proof you can ship something people can buy.
