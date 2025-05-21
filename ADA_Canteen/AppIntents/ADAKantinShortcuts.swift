//
//  ADAKantinShortcuts.swift
//  ADA Kantin
//
//  Created by Daven Karim on 14/05/25.
//

import AppIntents

struct ADAKantinShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: FindFoodIntent(),
            phrases: [
                "Find my food in \(.applicationName)",
                "Get food recommendations in \(.applicationName)"
            ],
            shortTitle: "Find Food🍴",
            systemImageName: "fork.knife"
        )
    }
}
