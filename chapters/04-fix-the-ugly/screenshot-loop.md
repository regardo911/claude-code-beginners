<!-- Chapter 4: the screenshot verification loop and every prompt that drives it (ch04:23-298). Claude has no eyes; this is how you hand it the picture. -->

# Chapter 4: The Screenshot Loop

Four steps, and the fourth one goes back to the first. Two or three rounds gets you about
80% of the way to a page you'd show someone.

**1. Claude writes the code.**

```
Redesign the task list with a clean, modern look. Use cards for each task instead of a flat list. Add subtle shadows, rounded corners, and a status badge with color coding.
```

**2. You screenshot the result.** `Cmd+Shift+4` on macOS, `Win+Shift+S` on Windows. Save it
into your project folder as `screenshot.png`, or anywhere you can name by path.

**3. You hand Claude the image.** Drag the file into the session, or type the path.

```
Here's a screenshot of the task list you just styled at ./screenshot.png. Tell me what looks wrong and fix it.
```

**4. Claude fixes and you verify.** Reload, screenshot again, critique again:

```
Better, but the spacing between cards is still uneven and the 'done' badge needs a green background, not gray.
```

**Checkpoint:** Claude named specific visual problems, not generalities. Generalities mean
your file path was wrong. Fix it and redo step 3.

## The design system closes the loop faster

Create `design-system.md` (in this folder), add the `## Design` block to your CLAUDE.md,
then:

```
Restyle the entire task list page using the design system. Use cards for each task. Apply the color-coded status badges.
```

You should see `#2563EB` for primary instead of a random blue, and the same values on every
card and button.

## A three-round worked example (ch04:129-155)

Round one:

```
Here's a screenshot at ./screenshot.png. The sidebar is too wide, the table headers blend into the rows, and the content is cramped. Fix all three.
```

Round two:

```
Here's the updated screenshot at ./screenshot.png. The sidebar links are touching, the table rows run together, and the page title is the same size as the section headers. Add spacing and a clear hierarchy.
```

Round three:

```
Here's the latest at ./screenshot.png. Add a blue left border on the active sidebar link so I know which page I'm on.
```

About eight minutes.

## Running it on the Task Tracker (ch04:159-188)

Start a fresh session so Claude re-reads CLAUDE.md and the design system, then:

```
Redesign the main task list page. Each task should be in a card component following the design system. The page should have a clean header with the app name, a task creation form with title and description inputs, and below that a list of task cards showing title, description, status badge, and creation date. Group tasks by status: in progress tasks first, then todo, then done.
```

Screenshot, then:

```
The task cards are too tall. Reduce the vertical padding. The form should be max-width 600px and centered. The status badges look too large next to the titles.
```

Screenshot again, then:

```
Much better. Two more things: add a subtle hover effect on the cards (slight shadow increase) and make the 'done' tasks slightly faded so in-progress tasks stand out.
```

## When you don't know what "good" looks like (ch04:190-212)

Screenshot one component of an app you admire, not the whole page, and paste it:

```
Make my task list page look like this. Match the spacing, typography, and layout. Use my design system colors instead of the ones in the screenshot.
```

Two references at once, layout and component:

```
The overall layout should match the first screenshot. Use my design system colors, not the ones in the image. The second screenshot is the card component I want to replicate.
```

This roughly halves the number of rounds. Screenshot a single component, get it right, then
the next one. Don't hand over something complex and expect one pass.

## Dark mode, while the app is still small (ch04:226-251)

```
Add a dark mode toggle to the app. Use Tailwind's dark mode utilities. Add a toggle button in the header. Respect the user's system preference as the default.
```

Then run the loop on both modes. Dark mode that works in code can still be light gray on
slightly lighter gray.

## Responsive (ch04:253-274)

Chrome DevTools, device toggle, phone resolution, screenshot:

```
Here's how the task list looks on mobile. The cards are too wide, the form overflows the screen, and the header text is too large. Make it responsive.
```

Three widths if you want to be thorough: phone 375px, tablet 768px, desktop 1280px:

```
Here are mobile, tablet, and desktop views. Fix the issues I've circled at each width.
```

## Empty and loading states (ch04:278-298)

The one visual problem Claude almost never handles on its own, and it makes the app look
broken rather than empty:

```
When there are no tasks, show an empty state illustration or message. Something like a simple icon with the text 'No tasks yet. Add one above to get started.' Make it centered in the area where tasks would normally appear, using text-secondary color.
```

```
Add skeleton loading states for the task cards. Gray rectangles where the title, description, and badge would be, with a subtle pulse animation.
```
