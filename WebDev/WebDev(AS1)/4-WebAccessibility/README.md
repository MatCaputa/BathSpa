# Exercise 4: Web Accessibility

"The Wondering Photographer — Gallery" — an accessible travel photography gallery built with WCAG 2.1 AA practices in mind. Demonstrates semantic landmarks, ARIA attributes, keyboard focus styling and meaningful alternative text.

## Files

| File | Description |
| --- | --- |
| [index.html](index.html) | Page markup with header, navigation, gallery `<article>`s and footer. |
| [styles.css](styles.css) | Stylesheet covering layout, focus states and gradients. |
| [media/](media/) | Photographs, logo image and shopping-basket icon. |

## View

Open [index.html](index.html) directly in any modern browser. Try navigating with the keyboard alone — every interactive element has a visible focus outline.

## Accessibility Features

- **Semantic landmarks** — `<header>`, `<nav>`, `<main>`, `<section>`, `<article>`, `<figure>`, `<footer>`.
- **ARIA attributes** — `aria-label` on the navigation and basket link, `aria-current="page"` on the active nav item, `aria-hidden="true"` on decorative icons.
- **Descriptive `alt` text** — every photograph has a detailed, meaningful description; decorative images use empty `alt=""`.
- **Keyboard focus styling** — `:focus-visible` outlines on all interactive elements.
- **Colour contrast** — text/background pairs chosen for readability.
- **Logical heading hierarchy** — `<h1>` → `<h2>` → `<h3>` with no skipped levels.

## Technologies

- HTML5 (semantic elements, ARIA).
- CSS3 (Flexbox, transitions, linear gradients).
- Google Fonts (Inter).
