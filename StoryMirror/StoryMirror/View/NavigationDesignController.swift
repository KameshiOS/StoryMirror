//
//  NavigationDesignController.swift
//  StoryMirror
//
//  Created by Kamesh on 09/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

extension UINavigationController {
    // This function is used to customise navigation bar
    func updateViews(setBackgroundWhite: Bool) {
        customiseBackButton()
        if setBackgroundWhite {
            navigationBar.shadowImage = UIImage()
            navigationBar.tintColor = UIColor.black
            navigationBar.barTintColor = UIColor.white
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 16)!]
            navigationBar.isTranslucent = true
            navigationBar.backgroundColor = UIColor.white
        } else {
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.isTranslucent = true
            navigationBar.backgroundColor = UIColor.clear
            navigationBar.tintColor = UIColor.white
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 16)!]
        }
    }
    func customiseBackButton() {
        let backImage = UIImage(named: "back")
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
    }
}

