---
name: flutter-stack
description: Use when writing, reviewing, or scaffolding Flutter/Dart code. Enforces the preferred tech stack, architecture, and conventions.
---

# Flutter Tech Stack & Architecture

## Packages

- **State management**: `flutter_bloc` (Cubits, no raw BLoCs unless complexity warrants it)
- **Navigation**: `auto_route` (code-generated routes)
- **Service locator**: `provider` only — never `get_it` or `get_it_migration`
- **Data classes**: `freezed` + `freezed_annotation` for all models, states, and sealed unions
- **JSON serialization**: `json_serializable` alongside freezed
- **Dependency injection**: Manual DI preferred — pass dependencies via constructors; use `provider` only when constructor injection is impractical (e.g. plugins, global services)

## Forbidden

- **DO NOT use `get_it`** — in any form (direct, via `get_it_migration`, or wrapped in a service locator abstraction). Use constructor injection and `provider` instead.

## Architecture

Feature-module structure. Each feature lives in `lib/features/<feature_name>/` with these layers:

```
lib/
  core/                  # shared utilities, constants, theme, common widgets
  features/
    <feature>/
      domain/            # entities, repositories (abstract), use-cases
      data/              # repository implementations, data sources, models
      presentation/      # cubits, states, bloc-to-widget wiring
      ui/                # screens, widgets, page-level composition
```

- **domain/**: Pure Dart. Entities (freezed), abstract repository contracts, use-cases (optional — add when logic is non-trivial).
- **data/**: Repository impls, remote data sources (API clients), local data sources (Hive/Drift/SharedPreferences), mappers.
- **presentation/**: Cubits + states (freezed), listeners, page-level BLoCProvider wiring.
- **ui/**: Stateless/Stateful widgets, screen composition, theming. No business logic here.

### When to add `data/`

Only when the feature has local storage, caching, or a dedicated API client. Simple features that only call one repository method can skip a separate data layer and put the impl directly in domain or a shared data layer.

### When to add `remote/` or `local/` sub-layers

Split `data/` into `data/remote/` and `data/local/` when a feature has both network and disk sources and the distinction matters. Don't over-split small features.

## Conventions

- Prefer `const` constructors everywhere possible.
- Use `freezed` for all data classes — no manual `==`/`hashCode`/`copyWith`.
- Cubits should be thin: delegate business logic to use-cases or repository methods.
- Name files after their primary export: `user_cubit.dart`, `user_state.dart`, `user_repository.dart`.
- Keep widgets small and composable. Extract sub-widgets into separate files when a screen exceeds ~200 lines.
- Use `context.read<T>()` / `context.watch<T>()` for BLoC access; avoid `BlocProvider.of(context)`.
- Prefer `sealed` freezed unions for state classes with distinct variants.
- Tests: feature-level in `test/features/<feature>/`, unit tests for domain/data, widget tests for UI, BLoC tests for presentation.
