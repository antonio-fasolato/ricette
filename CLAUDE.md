# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Ricette** is a personal Italian recipe collection website built with MkDocs. Markdown recipe files in `docs/` are compiled into a static site deployed to GitHub Pages.

## Instructions to Always Follow

- Ask the user if the recipe is to try or confirmed and what type of recipe it is (Primi, Secondi...)
- If not specified in the prompt, always ask which image or YouTube video should be included in the recipe (see `README.md` for examples of how to embed videos)
- Do not alter the recipe text — copy it exactly as written on the source site or in the input file
- If ingredients are divided into parts or sections, use `### Section name` subsections under `## Ingredienti`, each with its own two-column table
- If the recipe steps are divided into parts or sections, use `### Section name` subsections under `## Procedimento`, each with its own numbered list
- If the recipe needs to be baked and there is an oven temperature, add it at the start of `## Procedimento` (or the relevant section) as a block quote, e.g. `> Preriscaldare il forno a 180°`

## Commands

### Local Development

```bash
# Install dependencies
uv sync

# Start dev server with hot-reload
uv run mkdocs serve

# Build static site (output: ./site/)
uv run mkdocs build
```

### Docker

```bash
docker build --load -t ricette .
docker run --rm -ti -p12345:12345 ricette
```

### Utilities

```bash
./optimize-images.sh   # Convert images to WebP using ImageMagick
./generate-mosaic.sh   # Generate a random 15-image mosaic for the home page
python percentuali.py  # CLI to calculate ingredient percentages by weight
```

## Architecture

### Content Structure

All recipe content lives under `docs/`, organized by course category:

- `antipasti/` — Appetizers
- `primi/` — First courses (pasta, risotto, etc.)
- `secondi/` — Main courses
- `pane/` — Bread
- `dolci/` — Desserts
- `tecnica/` — Cooking techniques
- `da-provare/` — Recipes to try (same subcategory structure)
- `img/` — Image assets (WebP format)

Navigation in `mkdocs.yml` points to category `index.md` files, not individual recipes. Adding a new recipe only requires updating the relevant `index.md` — `mkdocs.yml` only needs changes when adding an entirely new category.

### Recipe Format

Recipes are markdown files with YAML frontmatter. The standard structure is:
1. YAML frontmatter with `tags:`
2. Title (`# Recipe Name`)
3. Image: `![](../img/filename.webp)` — use `../../img/` for files under `da-provare/`
4. `## Ingredienti` — two-column markdown table; optional subsections (`### Pasta`, `### Salsa`, etc.) each with their own table
5. `## Procedimento` — numbered steps
6. `## Note` (optional) — tips and variants
7. `## Origine` (optional) - the original link if it came from a link (formatted as a clickable link)

### Adding a New Recipe

```bash
# 1. Download and convert image
curl -o /tmp/recipe.jpg "<image-url>"
magick /tmp/recipe.jpg docs/img/Recipe-Name.webp

# 2. Create recipe file
# docs/<category>/Recipe-Name.md  (or docs/da-provare/<category>/Recipe-Name.md)

# 3. Add link to category index
# docs/<category>/index.md  (or docs/da-provare/<category>/index.md)
```

File names use PascalCase with hyphens (e.g. `Pasta-con-crema-di-carciofi.md`).

### Deployment

Pushes to `master` trigger the GitHub Actions workflow (`.github/workflows/uv.yml`) which builds and deploys to GitHub Pages automatically. The `develop` branch is used for work-in-progress.

### MkDocs Configuration

Key settings in `mkdocs.yml`:
- Theme: Material with search and tags plugins
- MathJax enabled for formula support (useful in baking/percentuali context)
- Validation rules enforce no broken links or orphaned files
