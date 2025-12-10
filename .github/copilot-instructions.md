# Copilot Instructions for The Tea House Project

## Project Overview
A static front-end for a Herbal Tea & Milk Tea shop (Mộc Trà) built with HTML5, CSS3, and vanilla JavaScript (ES6). Vietnamese-language e-commerce site with responsive design and collaborative Git workflow (4-week university project).

**Key Aspects:**
- Language: Vietnamese (UI, file names, comments use Vietnamese)
- Architecture: Static HTML pages + CSS modules + vanilla JS
- Deployment: Static files (no build pipeline)
- Admin: Separate admin dashboard (`admin/` folder)

## Architecture & File Organization

### CSS Architecture (Modular, Import-Based)
**Entry Point:** `assets/css/main.css` (imports all modules in order)

**Load Order (critical - must be preserved):**
1. `variables.css` - CSS custom properties (colors, spacing, typography)
2. `base.css` - Reset, `.container`, global `<body>` styles
3. `layout.css` - Header, footer, navigation, grid layout
4. `components.css` - Reusable UI components (buttons, cards, forms)
5. `pages.css` - Page-specific overrides and unique layouts
6. `login.css` - Login/signup page styles

**Critical Rules:**
- All color values use CSS custom properties from `variables.css` (e.g., `color: var(--color-primary)`)
- Spacing system: Use `--space-xs` (4px) through `--space-xxxl` (64px) variables—no magic numbers
- Typography: Lora for headings, Montserrat for body text (defined in `variables.css`)
- Don't add colors/spacing directly to CSS files—add to `variables.css` first
- Admin CSS (`admin/assets/css/`) uses separate import structure, does NOT include `login.css`

### HTML Structure
- **Pages:** Root level HTML files (e.g., `index.html`, `san-pham.html`, `blog.html`)
- **Admin Pages:** `admin/` folder (isolated, has own CSS)
- **Product Detail Pages:** Named `chi-tiet-san-pham-*.html` (Vietnamese naming convention)
- **No Component Framework:** Each page is standalone HTML; shared elements use CSS classes

### JavaScript
- **Single File:** `assets/js/main.js` (vanilla ES6)
- **Pattern:** IIFE (Immediately Invoked Function Expression) for initialization functions
- **No Build Process:** Direct script inclusion in HTML (`<script src="assets/js/main.js"></script>`)

**Example Pattern from Codebase:**
```javascript
(function initPasswordToggles() {
  document.querySelectorAll('.password-field').forEach(field => {
    const input = field.querySelector('input');
    const eye = field.querySelector('.eye-icon');
    if (!input || !eye) return;
    eye.addEventListener('click', () => {
      input.type = input.type === 'password' ? 'text' : 'password';
    });
  });
})();
```

## Naming Conventions

### CSS Classes (BEM-like with Underscores)
- **Block:** `.top-bar`, `.utility-header`, `.admin-sidebar`
- **Element:** `.top-bar__left`, `.top-bar__right` (double underscore)
- **Modifier:** `.nav-item.active` (plain class without prefix)
- **Dropdowns:** `.has-dropdown` (parent), `.dropdown-menu`, `.dropdown-column`

### File Naming
- **Pages:** Kebab-case in Vietnamese (e.g., `chi-tiet-san-pham-*.html`, `kinh-sach-ban-hang.html`)
- **CSS Files:** kebab-case (e.g., `admin-add-product.css`, `admin-dashboard.html`)
- **Images:** Vietnamese descriptors (e.g., `logoweb.png`)

### HTML Attributes
- **Query Parameters:** Categories use `?category=tra-thao-moc`, `?category=nguyen-lieu-tra-sua`

## Design System

### Color Tokens (from `variables.css`)
- `--color-primary` (#107e84) - Main brand teal, buttons, links
- `--color-text` (#191919) - Default text
- `--color-primary-light` & `--color-primary-dark` - Hover/active states
- `--color-danger` (#c74949), `--color-success` (#4b804b), `--color-alert` (#aa622a)

### Spacing Scale (8px Base)
- `--space-xs` (4px), `--space-sm` (8px), `--space-md` (16px), `--space-lg` (24px)
- `--space-xl` (32px), `--space-xxl` (48px), `--space-xxxl` (64px)

### Typography Scale (1.25 Ratio)
- Body base: 16px, line-height 1.5
- Headings: h1 (40px/2.5rem), h2 (32px/2rem), h3 (25px/1.563rem), h4 (20px/1.25rem)
- All line-heights: headings 1.2-1.3, body 1.5

## Common Developer Tasks

### Adding a New Page
1. Create HTML file at root (e.g., `new-page.html`)
2. Copy header/footer from existing page (standardized in `layout.css`)
3. Add page-specific CSS to `pages.css` (prefix with page identifier)
4. Link `assets/css/main.css` in `<head>`
5. Add navigation link to all pages (header appears in multiple files)

### Adding a New Component
1. Define styles in `components.css` (reusable classes)
2. Use CSS custom properties for colors/spacing
3. Create HTML using BEM-like class names
4. Example: `.product-card { padding: var(--space-lg); background: var(--color-second-bg); }`

### Admin Feature Development
- Admin pages are in `admin/` folder (separate namespace)
- Admin CSS imports: base.css → components.css → admin.css → admin-specific-page.css
- Does NOT include login.css (different layout paradigm)
- Sidebar nav (`admin-sidebar`, `admin-nav`) is shared across admin pages

### Modifying Navigation
- Main nav defined inline in multiple page `<header>` sections (not DRY but static site constraint)
- Dropdown structure: `.has-dropdown` > `.dropdown-menu` > `.dropdown-column`
- Update all pages when nav changes (search for `.main-nav`)

## Key Files to Know

| File | Purpose |
|------|---------|
| `assets/css/variables.css` | All design tokens (colors, spacing, fonts) |
| `assets/css/base.css` | Global resets, `.container` class, body styles |
| `assets/css/layout.css` | Header, footer, navigation layout |
| `assets/css/components.css` | Buttons, cards, forms, modals, modular UI |
| `assets/js/main.js` | Vanilla JS: smooth scrolling, password toggle, etc. |
| `design.md` | Design system documentation (typography, colors, spacing) |
| `admin/admin-dashboard.html` | Admin entry point, sidebar layout template |

## Important Patterns to Preserve

1. **No CSS Frameworks:** Pure CSS, no Tailwind/Bootstrap
2. **Static Generation:** No build pipeline; CSS must be valid immediately
3. **Vanilla JS Only:** No jQuery, React, or frameworks; use ES6 features
4. **Accessibility:** Font Awesome icons included; ensure semantic HTML
5. **Internationalization:** Vietnamese content; maintain UTF-8 encoding
6. **Git Workflow:** Feature branches (e.g., `feature/build-login`); collaborative team project

## When in Doubt
- Check `design.md` for design decisions and rationale
- Reference existing pages (e.g., `san-pham.html`, `ve-chung-toi.html`) for HTML structure patterns
- Use grep/search to find how other components implement similar features
- Preserve the 4-layer CSS import order—don't rearrange
