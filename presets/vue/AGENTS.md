# AGENTS.md

<!--
  TEMPLATE — reusable across projects.
  Fill in the bracketed placeholders for each new project, delete sections
  that don't apply, and keep the "Working Style" / "Verification" sections
  largely as-is — they encode agent behavior, not project specifics.
-->

opencode-template — a bare OpenCode starter template meant to be copied into new projects.

## This repo (the template itself)

- Contains no source code and no toolchain: there are no build/lint/test/typecheck commands to run. Don't invent one.
- The bracketed placeholders below are intentional — this file doubles as the template copied into new projects. Fill them in when scaffolding.
- Core skills are pre-installed and tracked in `skills-lock.json`; their sources live in `.agents/skills/`. Don't edit them by hand — change them via the `npx skills add` command in `README.md`.
- `.idea/` is WebStorm IDE metadata (gitignored via `.idea/.gitignore`); don't commit it.

<!--
  Describe the shape of this project and delete what doesn't apply:
  - Single app (backend-only, frontend-only, CLI, library, etc.)
  - Two independent apps (backend/ + frontend/)
  - Monorepo with N packages
  Keep only the "Backend" and/or "Frontend" sections below that match.
-->

- `backend/` — [language/framework, version, build tool] — *(omit if this project has no backend)*
- `frontend/` — [framework, bundler, package manager, UI library] — *(omit if this project has no frontend)*

## Working Style

- Inspect only the files relevant to the task before changing anything.
- Implement directly when the request is clear — don't plan, ask clarifying questions, or research obvious choices first.
- Keep changes small and localized; reuse existing code, state, services, components, and patterns.
- Do not modify unrelated files, over-engineer, refactor unnecessarily, or introduce new architecture unless asked.
- Avoid unnecessary sub-agents and broad repository exploration when the relevant files are already known.
- Escalate to deeper investigation and planning only when the task is genuinely complex, ambiguous, or blocked.
- Prefer `grep`/`glob` to locate the relevant method, endpoint, or component before reading a full file. Avoid reading entire controllers, services, or pages when only one function or section is relevant.
- Never start, stop, or restart the backend (`[run command]`) and/or frontend (`[dev command]`) dev server process(es) — keep whichever apply — for any reason, including to "pick up" code changes, to test a fix, or because a running instance looks stale. Assume it's already running and managed by the user. If a running instance appears out of date or needs restarting, tell the user and let them do it.

## Backend

*(Delete this whole section if the project has no backend.)*

Run commands from `backend/`:

```bash
[build/run command]
[test command]
```

- Server port: `[port]`.
- Database: [DB engine] on `[host:port]`, database `[name]`.
- Database schema is managed with [migration tool / ORM auto-update]; [note whether migrations exist].
- All routes except `[public route patterns]` require authentication ([auth mechanism]).
- Role-based authorization: [implemented / not implemented — describe if relevant].
- Controllers inject service interfaces; follow the existing pattern.
- [Any project-specific naming conventions to preserve, e.g. `FooServiceImp`].
- Responses use `[shared response wrapper type]`.
- Errors are handled by the existing `[global exception handler]`.
- [Any code-generation tool, e.g. Lombok] is used throughout.
- Follow existing entity, DTO, service, repository, and controller patterns.

## Frontend

*(Delete this whole section if the project has no frontend.)*

Run commands from `frontend/`.

- Use `[package manager]`; never [other package managers].
- Main commands: `[dev]`, `[build]`, `[lint]`, `[typecheck]`.
- [Routing convention, e.g. file-based routes generated from `src/pages/`].
- [UI library] components are auto-imported; do not import them manually — *(delete if not applicable)*.
- Prefer existing component usage already present in the codebase. Do not research or inspect [UI library] documentation unless the existing implementation cannot satisfy the requested change.
- Use [N]-space indentation.
- Generated [UI library]/type files are created by dev/build and should not be manually edited.
- If [UI library] types are missing, run `[dev/build command]` before `[typecheck command]`.

## UI

*(Delete this whole section if the project has no frontend/UI.)*

- [Primary UI library] is the primary UI component library. Prefer existing project components first, then [primary UI library], then [data-grid library] for data-heavy tables/CRUD grids. Only create a custom component when none of those can reasonably satisfy the requirement — do not recreate functionality the UI library or data-grid library already provides.
- **Pagination defaults to [data-grid library]:** use its built-in pagination for data grids. Do not build pagination controls from other components unless the design explicitly requires it.
- **Overriding [UI library] classes:** [note the project's specific override mechanism, e.g. a `ui`/`class` prop that appends rather than replaces theme classes, and how to force precedence]. Don't reason about merge order — just apply the documented override mechanism and move on.

## Design References

*(Delete this whole section if the project has no design-reference workflow, e.g. backend-only projects.)*

When implementing from a Figma, Stitch, screenshot, or other design reference:

- Treat the reference as the visual target; match its layout, spacing, hierarchy, typography, and visual appearance using the existing project UI system.
- Do not sacrifice the reference design just because a default component looks different.
- When a named reference is provided, use it directly — do not enumerate unrelated projects/screens, fetch large project listings, or research unrelated component APIs unless necessary. If locating a named screen requires listing projects/screens first, filter or grep the result for the given title instead of reading the full listing.
- If exact colors/spacing aren't available as tokens, use your best-guess values once rather than iterating on them by inspection.

### [Design Tool] (e.g. Google Stitch / Figma)

- Project: `[project name]`
- Project ID: `[project id]`
- Use this project for all [product name] UI/design tasks.
- When a screen is referenced, access it directly from this project.
- Do not enumerate or search unrelated projects.

## Verification

After implementation:

1. Run the most relevant lint/build/typecheck command.
2. For UI changes, perform one focused browser verification when practical.
3. Verify the changed flow rather than unrelated features.
4. Fix errors caused by the change, then stop — don't repeatedly re-test working, unrelated functionality.
5. Verify via lint/build/typecheck/compile only. Do not start, stop, or restart a dev server to smoke-test an endpoint or page — see the server-process rule under Working Style.
6. If live verification against a running server is genuinely necessary, stop and ask the user to confirm the server is running and up to date, rather than starting or restarting it yourself.

## Documentation

- Trust the actual code and configuration over aspirational documentation.
- `README.md` and other planning docs may describe planned features that are not implemented.
- Do not assume a feature exists because it is mentioned in documentation — verify from source code and configuration.