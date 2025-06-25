# 🍽️ ADA Kantin

ADA Kantin is a fully offline iOS app developed using **Swift** and **SwiftUI**, now refactored with a **Model-View-ViewModel (MVVM)** architecture. It helps learners at the Apple Developer Academy @ BINUS Tangerang (GOP 9) quickly discover and decide which meals to eat — enhanced with **Siri** and **Shortcuts integration** for hands-free experience.

## 💡 Project Background

This app originated from a challenge to *elevate the people's daily life at GOP*. We identified that learners in the academy often wasted valuable time searching for meals that matched their preferences (halal, healthy, allergen-free, affordable).

Initially designed for fast, offline access to canteen data, **ADA Kantin** has evolved to support **voice-based searching**, allowing users to focus on their work without needing to physically browse or interact with the app.

## 🧠 Problem-Solving & Design Approach

The project followed a **design thinking process**, including:
- Conducting interviews and analyzing feedback
- Creating user personas based on motivations and pain points
- Ideating with *How Might We* and Crazy 8 methods
- Designing low- and high-fidelity prototypes based on Apple Human Interface Guidelines
- Validating concepts via user testing

The app design now prioritizes:
- **MVVM architecture** for clean separation of concerns and easier maintenance
- **Siri Shortcuts support** so users can order food with voice commands
- Enhanced modularity to support future features

## 🛠️ Tech Stack

| Area         | Tech Used                          |
|--------------|------------------------------------|
| Language     | Swift                              |
| Framework    | SwiftUI                            |
| Architecture | Model-View-ViewModel (MVVM)        |
| Data Model   | Static Swift structs (no JSON/API) |
| Voice        | SiriKit, Shortcuts API             |
| UI Design    | Figma (Prototype: https://www.figma.com/proto/evs5ehEUXGyBGKK5Hev7Dh/Experience-Challenge---Daven-Karim?page-id=2018%3A406&node-id=2109-5003&viewport=111%2C381%2C0.4&t=oxxR18msuRsUaQPB-1&scaling=scale-down&content-scaling=fixed&starting-point-node-id=2109%3A4760) |

## 🧩 App Architecture

The codebase is structured in MVVM with dedicated components:

- `ContentView`: Root container, combines Tenant and Food views with unified navigation.
- `TenantView`, `TenantViewModel`, `TenantModel`: Handle tenant display, filtering, and logic.
- `FoodView`, `FoodViewModel`, `FoodModel`: Manage food listing, details, and filter.
- `SplashScreen`: Entry splash screen for branding.
- `DataHelper`: Central hub for static data (food and tenant items).
- `Set+Extensions`: Utility extensions for cleaner SwiftUI code.
- `SiriIntegration`: Handles intent definitions, shortcut creation, and Siri interactions.

Navigation is handled with `NavigationStack`, ensuring smooth transitions. Views are declarative, modular, and easy to extend.

## ✨ Features

- Browse a full list of food and tenants in GOP 9 canteen
- View detailed menus with prices and ingredient categories
- 100% offline — works without internet access
- Hands-free searching via Siri and Shortcuts
- MVVM-based code structure for better maintainability

## 🗣️ Siri & Shortcuts

We added **Siri Shortcut support** to enable:
- Quick food ordering using predefined voice commands
- Customizable user phrases for favorite food/tenant combos
- Seamless integration with system Shortcuts app

This feature is designed for busy learners who want to find foods without touching their device, helping them stay focused on their work.

## 🧪 Challenges & Learning

From this version, I learned to:
- Refactor code into MVVM cleanly
- Integrate SiriKit and Shortcuts API into a SwiftUI app
- Design intent definitions that match user mental models
- Modularize the codebase for easier future updates

## 🗺️ Future Improvements

- Migrate static data to JSON or API-based source
- Add local storage for user preferences
- Improve Siri Shortcut customization (dynamic suggestions)
- Improve Siri Feedback Response for richer UI experience

## 🙋‍♂️ Author

**Daven Karim**  
Apple Developer Academy @ BINUS

---

*This project reflects not only code and design skills, but a continuous effort to translate user needs into practical, innovative solutions.*
