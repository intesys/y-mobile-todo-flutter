# y-mobile-todo

##  Build app
prebuild: dart run build_runner build -d
path: lib/main.dart


## 1. GitFlow
Branches: master, dev, feature/name-1, bugfix/name-2.
Commit name structure: [name-1] Description
Merge request should contain no more than 40 files

## 2. Architecture
Clean Architecture + Riverpod
Dependency Injection: Riverpod
Domain layer: models, repositories, use-cases.
Data layer: entities, mappers from entities to domain model, implementations of repositories and providers.
Presentation layer: screens + riverpod

## 3. Supported flavors
- Dev

## 4. Code Development Rules
Lint rules described in analysis_options.yaml

## 5. Asynchrony support
Flutter Async

## 6. Abstractions for data sources and data access
Providers are responsible for specific services (e.g. http provider, local provider, etc.),
they use data layer entities. Do not have abstract base classes.
Repositories are responsible for gathering data from providers
and mapping it to the corresponding domain layer models. Have abstract base classes in domain layer.

## 7. App distributing
none

## 8. Approach for working with UI
One file = one widget.

## 9. Localization
Localization is implemented using EasyLocalization service.

## 10. Design system
Fonts, colors, frequently used constant values.

## 11. Supported platforms
Ios, Android