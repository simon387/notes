# Copilot Instructions

This repository is a personal developer knowledge base — a flat collection of Markdown notes, snippets, and references organized by technology.

## Repository Structure

Notes are organized into topic directories (e.g., `java/`, `javascript/`, `linux/`, `css/`, `sql/`, `python/`, `php/`). Each directory uses a lowercase `readme.md` as its index. Cross-references between files use relative Markdown links.

Top-level `.md` files cover standalone topics (e.g., `docker.md`, `regex.md`, `ffmpeg.md`).

## Markdown Conventions

- Use `+` for unordered list items (not `-` or `*`)
- Sub-list items are indented with 2 spaces under their parent `+`
- Sections within a file are separated by `---` horizontal rules
- Section headings use `## ` (h2); sub-sections use `### ` (h3)
- File titles use `# ` (h1) at the top
- Code blocks always specify the language (e.g., ` ```bash `, ` ```java `, ` ```javascript `)
- Inline code uses single backticks
- Directory index files are named `readme.md` (lowercase)

## Adding Notes

When adding a new note to an existing file, follow the pattern:

```markdown
## Section Title

Brief description (optional).

```language
code snippet here
```

---
```

When creating a new topic file, link it from the relevant `readme.md` index using:
```markdown
+ [Topic Notes](topic.md)
```

## No Build, Test, or Lint

There are no build scripts, test suites, or linters in this repository.
