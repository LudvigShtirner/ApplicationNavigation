//
//  CommonLocalization.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 07.11.2021.
//

// Subprojects
import SupportCode

// Apple
import Foundation

/// Расширение для обозначения дефолтного словаря для переводов
extension LocalizationResource {
    static var commonTable: (bundle: Bundle, tableName: String) { (.main, "CommonLocalization") }
}
