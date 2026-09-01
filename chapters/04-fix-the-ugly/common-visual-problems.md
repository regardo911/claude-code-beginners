<!-- Chapter 4: the five visual problems Claude produces most often, and the one-line fix for each (ch04:214-224). Paste the fix straight into the session. -->

# Common Visual Problems

| Problem | What it looks like | One-line fix |
|---------|-------------------|-------------|
| Too much spacing | Elements float in whitespace, page feels empty | "Reduce all padding and margins by 30%. Elements should relate to each other." |
| Same visual weight | All text same size, color, weight. Nothing stands out. | "Create a clear visual hierarchy. Title largest, headers smaller, body smallest." |
| Buttons don't look clickable | Just text, or faint border that doesn't register | "Primary buttons: bg-primary + white text. Secondary: visible border." |
| Inconsistent border radius | Mix of sharp corners, rounded, and pill shapes | "rounded-lg on cards, rounded-md on buttons and inputs. Nothing else." |
| No hover feedback | Hover over a card or button, nothing happens | "Cards: increase shadow on hover. Buttons: darken. Lists: subtle background." |
