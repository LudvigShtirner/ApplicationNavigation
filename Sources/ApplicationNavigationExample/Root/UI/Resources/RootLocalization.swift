//
//  RootLocalization.swift
//  ApplicationNavigationExample
//
//  Created by Алексей Филиппов on 06.11.2021.
//

// Subprojects
import SupportCode

/// Локализация модуля
final class RootLocalization: LocalizationResource {
    static let cancel = localize(for: "#KEY_Cancel")
    static let modal = localize(for: "#KEY_Modal")
    static let push = localize(for: "#KEY_Push")
    static let fall = localize(for: "#KEY_Fall")
}
