//
//  Set+Extensions.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import Foundation

extension Set {
    mutating func toggle(_ member: Element) {
        if contains(member) {
            remove(member)
        } else {
            insert(member)
        }
    }
}

extension Int {
    var formattedWithSeparator: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = "."
        return numberFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

//extension LocalizedStringResource {
//    static let siriFoodPrompt = LocalizedStringResource(
//        "What are you in the mood for?",
//        table: "Siri",
//        comment: "Prompt shown when user asks Siri to find food"
//    )
//    
//    static let siriFoodFollowUp = LocalizedStringResource(
//        "Got some great profiles ready. Which one sounds good?",
//        table: "Siri",
//        comment: "Follow up question after showing profiles"
//    )
//    
//    // Tambahkan lainnya sesuai kebutuhan
//}

