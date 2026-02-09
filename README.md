# 🎼 TabWriter

**TabWriter** is a high-performance musical tablature editor built with Flutter. It follows **Clean Architecture** principles and uses **Drift (SQLite)** for reactive local persistence. The project is designed to ensure musical integrity by validating measure sequences and is structured to scale for a future backend integration with Node.js and MySQL.

---

## 🎯 Project Overview

TabWriter isn't just a text field for tabs; it's a structured musical tool. Each song is broken down into **Measures**, ensuring that every bar of music is accounted for, validated, and stored with high performance.

### 🌟 Key Features

- **Measure-by-Measure Logic**: Edit specific parts of a song without breaking the rest of the tab.
- **Strict Validation**: The `TabValidator` ensures no duplicate measure IDs and no gaps in the musical sequence.
- **Relational Persistence**: Uses a robust SQL schema to manage Users, Tabs, and Measures.
- **Clean Architecture**: Decoupled layers (Domain, Data, UI) for maximum testability and maintainability.
- **Reactive UI**: Built with Cubit (Bloc) for real-time state updates.

---

## 🛠️ Tech Stack

### Frontend & Logic
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

### Database (Offline First)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
- **Drift (Moor)**: Reactive persistence library with static typing and SQL support.

### State Management & Routing
- **BLoC/Cubit**: Predictable state management.
- **Go Router**: Declarative navigation.

---

## 🏗️ Architecture

The project follows **Clean Architecture** to ensure that business rules are independent of external frameworks.



### Folder Structure
```text
lib/
├── app/
│   ├── core/
│   │   ├── database/       # .drift schema files and AppDatabase config
│   │   └── theme/          # App design system
│   └── features/
│       └── tab/
│           ├── domain/     # Entities, Validators, and Repository Interfaces
│           ├── data/       # Models, Repository Impl, and DataSources
│           └── ui/         # Cubits, Pages, and Widgets
