# Exercise 1: Semantic Markup

A "Cooking with Andy!" recipe page rebuilt with semantic HTML5 elements — demonstrating correct use of document landmarks, content sectioning, headings and list structure for a chocolate-chip cookie recipe.

## Files

| File | Description |
| --- | --- |
| [index.html](index.html) | Page markup with embedded `<style>` block. |
| [favicon.svg](favicon.svg) | SVG favicon shown in the browser tab. |

## View

Open [index.html](index.html) directly in any modern browser — no build step required.

## Semantic Elements Used

**Document landmarks**
- `<header>` — top section with page heading and navigation.
- `<nav>` — navigation links list, labelled with `aria-label`.
- `<main>` — primary content area.
- `<footer>` — supplementary information at the bottom.
- `<time>` — machine-readable date with the `datetime` attribute.

**Content sectioning**
- `<article>` — single recipe block (title, description, sub-sections).
- `<section>` — recipe sub-section grouping (ingredients, instructions).
- `<aside>` — supplementary tip tangential to the parent section.

**Text and headings**
- `<h1>` — page title.
- `<h2>` — recipe title.
- `<h3>` — section titles.
- `<p>` — paragraphs.

**Lists**
- `<ul>` — unordered ingredients list.
- `<ol>` — ordered, step-by-step instructions.
- `<li>` — individual list items.

**Other standard elements**
`<html>`, `<head>`, `<body>`, `<meta>`, `<title>`, `<style>`, `<a>`.

## Head Metadata

- `<meta name="description">` — SEO page description.
- `<meta name="keywords">` — SEO keywords.
- `<meta name="author">` — author metadata.
- `<link rel="icon">` — SVG favicon for the browser tab.
