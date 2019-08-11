//
//  ButtonDesign.swift
//  StoryMirror
//
//  Created by Kamesh on 09/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

@IBDesignable class ButtonDesign: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        clipsToBounds = true
    }
}

@IBDesignable class ViewDesign: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        clipsToBounds = true
    }
}
