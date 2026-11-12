# Clean Users — Flutter Clean Architecture Demo

A small Flutter app that lists users from a REST API and shows a detail
screen. Built to demonstrate **clean architecture, Riverpod state
management, REST integration, and testing** in a way that scales.

## What it shows
- **Clean architecture** with three layers:
  - `domain/` — entities, repository contracts, use-cases (pure Dart, no framework)
  - `data/` — models (JSON), remote data source, repository implementation
  - `presentation/` — Riverpod providers + screens
- **Riverpod** for dependency injection and state (loading / error / data handled by `AsyncValue`)
- **REST** call with the `http` package (JSONPlaceholder API)
- **Tests**: a unit test for the use-case (mocked repository with `mocktail`) and a widget test

## Architecture (data flow)
```
UI (ConsumerWidget)
   -> watches usersProvider (FutureProvider)
      -> GetUsers (use-case)
         -> UserRepository (contract)
            -> UserRepositoryImpl
               -> UserRemoteDataSource -> REST API
```
The UI never talks to the API directly. Swapping REST for Firebase or a
local cache would only change the `data/` layer.

## Run it
```bash
flutter pub get
flutter run
```

## Test it
```bash
flutter test
```

## Stack
Flutter · Dart · Riverpod · http · Equatable · flutter_test · mocktail

---
Built by **Maryam Rahim** — Flutter developer, 20+ apps shipped.
Portfolio: https://developermaryam.netlify.app
