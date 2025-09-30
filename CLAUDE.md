# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Mintlify documentation site. Mintlify is a documentation platform that uses MDX (Markdown + React components) to create interactive documentation sites.

## Development Commands

### Local Development
```bash
# Install Mintlify CLI (requires Node.js v19+)
npm i -g mint

# Start local development server at http://localhost:3000
mint dev

# Use custom port
mint dev --port 3333

# Update CLI to latest version
npm mint update
```

### Validation
```bash
# Check for broken links in documentation
mint broken-links
```

## Architecture

### Configuration
- `docs.json`: Main configuration file that defines:
  - Site theme and colors
  - Navigation structure (tabs, groups, pages)
  - Logo and branding
  - Footer and social links
  - Contextual options for AI tools integration

### Content Structure
Documentation is organized in a tab-based navigation:

1. **Guides Tab**:
   - `index.mdx`, `quickstart.mdx`, `development.mdx`: Getting started pages
   - `essentials/`: Core documentation writing guides (settings, navigation, markdown, code, images, reusable-snippets)
   - `ai-tools/`: AI tool integration guides (cursor, claude-code, windsurf)

2. **API Reference Tab**:
   - `api-reference/introduction.mdx`: API overview
   - `api-reference/endpoint/`: Example endpoint documentation (get, create, delete, webhook)
   - `api-reference/openapi.json`: OpenAPI spec for auto-generated API docs

3. **Shared Resources**:
   - `snippets/`: Reusable MDX content snippets
   - `images/`: Image assets
   - `logo/`: Light and dark logo variants

### Page Format
All documentation pages use MDX with frontmatter:
```mdx
---
title: "Page Title"
description: "Page description"
---

Content here with MDX components
```

### Navigation System
Pages are added to navigation by:
1. Creating the `.mdx` file in appropriate directory
2. Adding the page path (without extension) to `docs.json` under the relevant group in the navigation structure

### Deployment
Changes are automatically deployed to production when pushed to the main branch (requires GitHub app integration from Mintlify dashboard).

## Common Tasks

When adding new documentation pages:
1. Create `.mdx` file in appropriate directory (essentials/, ai-tools/, api-reference/, etc.)
2. Add frontmatter with title and description
3. Update `docs.json` navigation structure to include the new page path
4. Test locally with `mint dev`
5. Verify no broken links with `mint broken-links`

When modifying navigation:
- Edit the `navigation.tabs` array in `docs.json`
- Pages are referenced by their file path without the `.mdx` extension
- Groups organize related pages together

When updating branding:
- Edit colors in `docs.json` under the `colors` key
- Update logos in `logo/` directory (light.svg and dark.svg)
- Update favicon at root level