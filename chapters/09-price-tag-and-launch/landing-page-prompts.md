<!-- Chapter 9: the landing page, built one section at a time (ch09:152-215). Your app is behind a login wall; a stranger needs a page that explains it. -->

# Chapter 9: Landing Page Prompts

The whole page in one prompt, if you want it fast:

```
Create a landing page at the root URL (move the current task list to /dashboard). The landing page should have: a headline that explains the value in one sentence, three feature highlights with icons, a pricing section showing Free vs Pro, a "Get Started" button that goes to the signup page, and a footer with basic links. Use the design system. Make it conversion-focused: the Get Started button should be visible without scrolling.
```

Or one section at a time, checking after each.

**Hero.** 8-12 word benefit headline, one-line subheadline, big button, app screenshot,
taking 60-80% of the desktop viewport:

```
Build the hero section with a headline, subheadline, CTA button, and an app screenshot on the right. The CTA links to /signup. On mobile, stack the text above the screenshot.
```

**Features.** Three cards. Three only, since more overwhelms:

```
Add a features section below the hero with three cards in a row, using Lucide icons. Card 1: Status Tracking (visual boards with drag-and-drop). Card 2: Smart Reminders (due date notifications). Card 3: Priority System (focus on what matters first). On mobile, stack the cards.
```

**Pricing.** Both prices visible without clicking:

```
Add a pricing section with two cards: Free (10 tasks, basic features) and Pro ($5/month, unlimited tasks, priority support, Most Popular badge). Give the Pro card a colored border. Pro CTA reads "Upgrade to Pro" and links to checkout; Free CTA reads "Get Started Free" and links to /signup.
```

**Footer.** Trust and legal only, no selling:

```
Add a minimal footer with links to /privacy, /terms, a placeholder social link, and a copyright line. Nothing more.
```

Then run the Chapter 4 screenshot loop twice: desktop, then mobile. Mobile is where landing
pages break: hero images overflow, cards stack wrong, buttons get too small to tap.

```
Here's the landing page. The headline is too small, the Get Started button doesn't stand out, and the pricing cards need more contrast between Free and Pro. Fix all three.
```

## The four rules the prompts encode

- **Headline above the fold.** Specific, not corporate. "Track your tasks. Ship your
  projects. Stop forgetting things," not "your all-in-one project management solution."
- **Credibility signals.** No users yet? "Built and audited in 48 hours." "Passed a 20-point
  security review."
- **One CTA.** One button, one destination. Not three buttons and a "Learn More".
- **Pricing visible without clicking.** Free vs Pro side by side.
