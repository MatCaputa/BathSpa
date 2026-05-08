# Exercise 3: Page Layout

"J's Gallery" — a photo and video gallery page demonstrating four distinct layout techniques (Flexbox, CSS Grid, Float, and a wrapping Flex row), plus a JavaScript lightbox preview, four responsive breakpoints and basic accessibility.

## Files

| File | Description |
| --- | --- |
| [index.html](index.html) | Page markup with header, about section, gallery and lightbox container. |
| [styles.css](styles.css) | Stylesheet covering all four layout techniques and breakpoints. |
| [script.js](script.js) | Lightbox open/close behaviour with fade animations. |
| [media/](media/) | Gallery images and video. |

## View

Open [index.html](index.html) directly in any modern browser. Click any gallery image to open the lightbox preview, then click the background or the close button to dismiss.

## Layout Techniques

| # | Element | Technique | Purpose |
| --- | --- | --- | --- |
| 1 | `body` | Flexbox (column) | Centres content horizontally on the page |
| 2 | `nav ul` | CSS Grid (auto column flow) | Horizontal navigation bar |
| 3 | `#about > img` | Float right | Text wraps around the image |
| 4 | `#gallery` | Flexbox (row, wrapping) | Images fill the available space and wrap |

## Responsive Design

- Four breakpoints: `1000px`, `750px`, `550px`, `380px`.
- Font sizes scale down at each breakpoint via CSS custom properties (`--title-size`, `--text-size`).
- Gallery image height reduces at each breakpoint.
- Below `380px` the gallery switches to a single column.

## JavaScript — Lightbox

- Click any image to open a fullscreen preview.
- Close by clicking the background or the close button.
- Fade-in and fade-out CSS animations.
- The element is hidden after the close animation finishes via the `animationend` event.

## Accessibility

- Semantic landmarks: `<header>`, `<nav>`, `<main>`, `<section>`.
- `aria-label` on navigation and both sections.
- `alt` text on every image.
- `loading="lazy"` on gallery images.
- Fallback text inside `<video>` for unsupported browsers.
