# Exercise 2: CSS Styling

"Machine Gym — Our Story" page styled with an external stylesheet. Demonstrates CSS custom properties, the box model, typography, hover animation, three responsive breakpoints and a `prefers-reduced-motion` accessibility fallback.

## Files

| File | Description |
| --- | --- |
| [index.html](index.html) | Page markup with semantic `<main>`, `<article>`, `<section>` and `<aside>`. |
| [styles.css](styles.css) | Full annotated stylesheet. |
| [styles.min.css](styles.min.css) | Minified stylesheet — drop-in replacement for performance. |

## View

Open [index.html](index.html) directly in any modern browser. To use the minified stylesheet, swap the `<link>` href to `styles.min.css`.

## CSS Techniques

- **Custom properties** — `:root` variables for colours (`--color-gray`, `--color-white`, `--color-green`, `--color-purple`) and font sizes (`--font-size-h1` through `--font-size-p`).
- **Reset** — default `margin` and `padding` removed with the `*` selector.
- **Box model** — `margin`, `padding` and `border-radius` used throughout for spacing and rounded corners.
- **Typography** — font family, size, weight, colour and alignment set per element.
- **Auto centering** — `<article>` centred horizontally with `margin: 0 auto` and a percentage width.

## Pseudo-classes & Animation

- **`:hover`** — used on `h1` to trigger animation, and on `aside` to switch the background colour to purple.
- **`@keyframes heartbeat`** — scales the title from `1.0` to `1.2`, running as an infinite alternating animation while hovered.

## Responsive Design

Three breakpoints adjust article width and font sizes:

| Breakpoint | Article width | Notes |
| --- | --- | --- |
| `≤ 950px` | 70% | Fonts reduced |
| `≤ 600px` | 80% | Fonts reduced further |
| `≤ 360px` | 100% | Border radius and body padding removed |

**Variable overwriting** — the `:root` CSS variables are redefined inside each media query so all elements update automatically.

## Accessibility

- **`prefers-reduced-motion`** — the heartbeat animation is disabled for users who have reduced motion enabled at the OS level.
- Semantic landmarks: `<main>`, `<article>`, `<header>`, `<section>`, `<aside>`.
- `lang="en"` set on `<html>`.
