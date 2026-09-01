<!-- Chapter 4: the Task Tracker's design system, exactly as the book prints it (ch04:71-108), with the dark variants from ch04:243-249. This is the worked example. The project-neutral template you copy into your own project is starter-kit/design-system.md. -->

<!-- Two tokens here miss the book's own bar. ch12:27 sets WCAG AA at 4.5:1 for text; Success #16A34A comes out at 3.30:1 on #FFFFFF and Warning #D97706 at 3.19:1, and both fail against #F9FAFB too. The other eight clear it. Apply ch04:222's "bg-primary + white text" pattern to either one and the label is under the bar. Values left as printed. -->

# Design System

## Colors
- Primary: #2563EB (blue-600)
- Primary hover: #1D4ED8 (blue-700)
- Success: #16A34A (green-600)
- Warning: #D97706 (amber-600)
- Danger: #DC2626 (red-600)
- Background: #F9FAFB (gray-50)
- Card background: #FFFFFF
- Text primary: #111827 (gray-900)
- Text secondary: #6B7280 (gray-500)
- Border: #E5E7EB (gray-200)

## Typography
- Headings: Inter, font-semibold
- Body: Inter, font-normal
- Small text: text-sm, text-secondary color
- Page title: text-2xl
- Card title: text-lg

## Spacing
- Page padding: px-6 py-8
- Card padding: p-4
- Between cards: space-y-3
- Between sections: space-y-6

## Components
- Cards: bg-white rounded-lg shadow-sm border border-gray-200 p-4
- Buttons (primary): bg-primary text-white px-4 py-2 rounded-md hover:bg-primary-hover
- Buttons (secondary): bg-white border border-gray-200 text-gray-700 px-4 py-2 rounded-md
- Status badges: px-2 py-1 rounded-full text-xs font-medium
  - todo: bg-gray-100 text-gray-700
  - in_progress: bg-blue-100 text-blue-700
  - done: bg-green-100 text-green-700
- Input fields: border border-gray-300 rounded-md px-3 py-2 text-sm

## Dark Mode
- Background: #111827 (gray-900)
- Card background: #1F2937 (gray-800)
- Text primary: #F9FAFB (gray-50)
- Text secondary: #9CA3AF (gray-400)
- Border: #374151 (gray-700)

---

Point CLAUDE.md at this file with the block from ch04:112-115:

```
## Design
Follow design-system.md for all styling decisions. Do not deviate from the defined colors, spacing, or component styles without explicit instruction.
```
