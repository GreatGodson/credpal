# Credpal App

## 📖 Overview

The **Credpal App** is a Flutter application designed with **Clean Architecture** principles.
While the app currently consists of UI designs based on a provided *
*[Figma link](https://www.figma.com/design/KZKDiLKAnm04rPAKMx350o/Untitled?node-id=1-35&t=3rWR9PJ6Yc16OtjY-0)
**, it is structured in a way that allows easy expansion into a fully functional commerce
application.

This project follows the **Domain-Layered Clean Architecture** approach, ensuring maintainability,
scalability, and separation of concerns.

---

## 🏛️ Clean Architecture Structure

This project follows the **Uncle Bob's Clean Architecture** principle, splitting the codebase into
well-defined layers:

### **1. Presentation Layer (UI & Widgets)**

- Contains UI elements built using Flutter widgets.
- Handles animations using **flutter_animate**.

This architecture ensures:
✅ **Separation of Concerns** (each layer has a single responsibility)
✅ **Scalability** (easy to add features without affecting other layers)
✅ **Testability** (independent layers allow for unit testing)

## Screenshots

## NB: The App contains animations, so screenshots might not look well aligned due to playing animations,

## kindly follow this link to see demo video of the app

|                    Dashboard Screen                    |                     Dashboard Page                     | 
|:------------------------------------------------------:|:------------------------------------------------------:|  
| <img src="assets/graphics/dashboard1.png" width="500"> | <img src="assets/graphics/dashboard2.png" width="500"> |

---

## 🛠️ Major Packages Used

Here are some of the core packages used in this project:

| Package Name        | Usage                                          |
|---------------------|------------------------------------------------|
| `flutter_animate`   | Used for smooth animations throughout the app. |
| `json_serializable` | Helps with JSON parsing and data modeling.     |
| `get_it`            | Used for handling dependency injection         |

---

## 🚀 Getting Started

### **Prerequisites**

Ensure you have the following installed:

- **Flutter SDK** (latest stable version)
- **Dart** (latest version)
- **Android Studio** or **VS Code** (for development)
- **Git** (for version control)

### **Clone the Repository**

```sh
git clone https://github.com/GreatGodson/credpal
cd credpal
```

### **Install Dependencies**

```sh
flutter pub get
```

### **Run the App**

```sh
flutter run
```

For specific platforms:

```sh
flutter run -d chrome      # Run on Web
flutter run -d android     # Run on Android
flutter run -d ios         # Run on iOS (Mac required)
```

### **Analyze & Format Code**

```sh
flutter analyze  # Checks for issues in the code
flutter format . # Formats code properly
```

---

## 📂 Folder Structure

```
lib/
 ├── core/                      # Core utilities, themes, etc.
 │   ├── framework/              # App-wide utilities (navigation, colors, etc.)
 │
 ├── presentation/              # UI Layer
 │   ├── pages/                  # Screens & Pages
 │   ├── components/             # Reusable widgets
 │
 ├── main.dart                   # Entry point of the application
```

## 📧 Contact

For any questions, feel free to reach out:

- **Email**: godsongreatokezie@gmail.com
- **GitHub**: [godson](https://github.com/GreatGodson)

---

Happy Coding! 🚀📚

