# 🍽️ ADA Kantin

ADA Kantin is a fully offline iOS app developed using **Swift** and **SwiftUI**, designed to help learners at the Apple Developer Academy @ BINUS (GOP 9) quickly discover meals based on their preferences—without having to walk around searching and asking tenants repeatedly.

## 💡 Project Background

This project was part of a challenge to *elevate daily life at GOP 9*. Our team identified a recurring user pain point: many learners waste valuable time searching for food that matches their preferences (halal, healthy, allergen-free, affordable). 

The solution was to provide a quick, clean, and simple interface to access food stall data—including menus, prices, and ingredients category in one place, offline.

## 🧠 Problem-Solving Approach

We followed a **design thinking process**, which included:
- Conducting interviews and analyzing feedback
- Creating user personas based on motivations and pain points
- Ideating with *How Might We* and Crazy 8 methods
- Designing low-fidelity sketches and HIG-compliant wireframes
- Validating ideas with concept testing before implementation

I translated these validated ideas into code using native SwiftUI components, focusing on clean structure and reusability. I worked with static data models due to offline restrictions and beginner-level experience.

## 🛠️ Tech Stack

| Area        | Tech Used         |
|-------------|-------------------|
| Language    | Swift             |
| Framework   | SwiftUI           |
| Data Model  | Static Swift structs (no JSON, no API) |
| UI Design   | Figma (based on Apple Human Interface Guidelines) |

## 🧩 App Architecture

The app is divided into modular Swift files with clearly defined responsibilities:

- `ContentView.swift`: Serves as the main container that combines both the Food and Tenant views. It includes a navigation bar setup and applies the global accent color for the app's UI.
- `FilterView.swift`: Contains the logic for filtering models. This file does not render any view directly but supports the filtering mechanism used across the app.
- `Food.swift`: Manages the entire food-related interface and logic, including the main food view, food card component, food detail view, filter handling, and the food filter view.
- `SplashScreen.swift`: Implements the app's splash screen displayed at launch to create a polished and branded entry point.
- `SumberData.swift`: Acts as the central hub for all static data, containing hardcoded information about food items and tenants due to offline restrictions.
- `Tenant.swift`: Handles the tenant listing view, filtering logic, the tenant filter interface, and the detail view for each food stall.

Each file is designed with modularity in mind, making the codebase easier to maintain and scale—even as a beginner.

Navigation is built using native SwiftUI `NavigationStack`, ensuring smooth flow between pages. All views are composed with SwiftUI's declarative syntax to keep layout concise and readable.

## ✨ Features

- View a full list of food and tenants in the GOP 9 canteen
- See detailed menu items with pricing and ingredients info
- 100% offline—no internet needed at all
- Clean, simple UI with smooth navigation

## 🧪 Challenges & Learning

As a beginner, I learned how to:
- Structure reusable views in SwiftUI
- Manage static data efficiently using Swift structs
- Follow Apple's HIG to build familiar and user-friendly interfaces
- Translate user research into working code
- Organize code files to keep logic modular and readable

I chose not to use JSON or APIs in this version due to my current skill level, but plan to refactor the data model in the future for scalability.

## 🗺️ Future Improvements

- Implement JSON-based data parsing for easier updates
- Save user preferences or recent selections locally
- Animate transitions for better user experience

## 🙋‍♂️ Authors

**Daven Karim** || **Alvin Justine** || **Alya Salsabila Haristian**
Apple Developer Academy @ BINUS

---

*This project was our first major SwiftUI app, built fully from scratch based on real user research. It represents not just our code, but our understanding of how to translate user needs into a product.*

