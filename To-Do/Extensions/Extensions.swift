//
//  Extensions.swift
//  To-Do
//
//  Created by Sora on 4.12.2022.
//

import Foundation
import UIKit
import SwiftUI

extension UIViewController {
    func changeNavBarAppearance() {
        let apperance = UINavigationBarAppearance()
        apperance.configureWithTransparentBackground()
        apperance.backgroundColor = UIColor(named: "NavBarColor")
        apperance.titleTextAttributes = [.foregroundColor: UIColor(named: "titleColor") ?? .systemGray]
        navigationItem.standardAppearance = apperance
        navigationItem.scrollEdgeAppearance = apperance
    }
}

extension UIView {
    func applyShadow(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
