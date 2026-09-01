<!-- Chapter 10: the design-system.md template from the starter kit (ch10:242). Structure and values from ch04:69-108 and ch04:240-249. Keep the color system, typography scale, spacing values and component definitions; change the specific values (ch10:242). The Task Tracker's status names have been stripped out. -->

<!-- Two of these tokens miss the book's own contrast bar: Success #16A34A is 3.30:1 on #FFFFFF and Warning #D97706 is 3.19:1, against the WCAG AA 4.5:1 that ch12:27 sets for text. Both are fine for a large heading or a border and both fail as body text or as a button background under white text (ch04:222). The other eight clear 4.5:1. Values kept as the book prints them; swap them when you swap the palette. -->

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

## Dark Mode
- Background: #111827 (gray-900)
- Card background: #1F2937 (gray-800)
- Text primary: #F9FAFB (gray-50)
- Text secondary: #9CA3AF (gray-400)
- Border: #374151 (gray-700)

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
  - [your first state]: [bg-gray-100 text-gray-700]
  - [your second state]: [bg-blue-100 text-blue-700]
  - [your third state]: [bg-green-100 text-green-700]
- Input fields: border border-gray-300 rounded-md px-3 py-2 text-sm
