<!-- Chapter 9: the five gates before you tell anyone (ch09:217-227). One action each, one pass condition each. -->

# Minimum Viable Launch Checklist

- [ ] **1. Mobile.** Open the landing page and dashboard on a phone.
      *Pass:* nothing breaks, every button is tappable.
- [ ] **2. Signup end to end.** In a private window: landing page, Get Started, create an
      account, land on the dashboard, create a task, upgrade to Pro with the test card.
      *Pass:* the task limit is gone.
- [ ] **3. Payments end to end.** In test mode, complete a purchase, then cancel the
      subscription in Stripe.
      *Pass:* the charge shows in the dashboard, the database flips to Pro, and canceling
      reverts to Free.
- [ ] **4. Error states.** Force a failed payment, a non-firing webhook, and a free user
      creating task #11.
      *Pass:* each shows a clear message, not a white screen.
- [ ] **5. Load speed.** Chrome DevTools, Network tab, reload.
      *Pass:* page load under 3 seconds. Over that, tell Claude to compress images,
      lazy-load below-fold content, and shrink JS bundles.

Five passes and you're ready to share.

## The first 30 days (ch09:261-270)

One action per week.

- [ ] **Week 1.** Post the landing page URL, not the login, on Twitter and one relevant
      subreddit, and put it in your bios. *Target:* your first 10 signups.
- [ ] **Week 2.** Turn on Vercel Analytics and read the drop-off funnel. *Target:* find the
      one weakest step and fix it.
- [ ] **Week 3.** Email your signups one question: "What would make this better?"
      *Target:* one feature request you didn't expect.
- [ ] **Week 4.** Build the most-requested feature, then announce it. *Target:* one shipped
      feature, then repeat.

The launch gets you to the starting line. Everything after is the work.
