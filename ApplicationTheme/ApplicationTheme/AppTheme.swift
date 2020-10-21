/**
 Implement the theme.
 
 Copyright © 2018 Upstart Illustration LLC. All rights reserved.
 */

import Foundation
import UIKit

class AppTheme: UIStyle {
    enum ButtonStyle {
        case primary
        case secondary
        case tertiary
    }
    
    enum LabelStyle {
        case inputField
        case footer
        case regular12
        case regular15
    }
    
    enum TableViewStyle {
        case simple
    }
    
    enum TextFieldStyle {
        case inputField
    }
    
    enum TextViewStyle {
        case regular12
        case regular15
        case bold(text: String)
        case link(text: String, url: URL)
    }

    enum ImageStyle {
        case empty
    }

    enum ViewStyle {
        case empty
    }

    enum ProgressViewStyle {
        case empty
    }
}

extension AppTheme: UITheme {

    typealias Style = AppTheme
    
    func apply(_ styles: [ButtonStyle], toButton button: UIButton) {
        for style in styles {
            switch style {
            case .primary:
                button.backgroundColor = UIColor.black
                button.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 12.0)
                button.setTitleColor(UIColor.white, for: .normal)
            case .secondary:
                button.layer.borderColor = UIColor.black.cgColor
                button.layer.borderWidth = 1.0
                button.backgroundColor = UIColor.white
                button.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 12.0)
                button.setTitleColor(UIColor.black, for: .normal)
            case .tertiary:
                print("tertiary")
            }
        }
    }
    
    func apply(_ styles: [LabelStyle], toLabel label: UILabel) {
        for style in styles {
            switch style {
            case .inputField:
                label.font = UIFont(name: "Arial-BoldMT", size: 14.0)
            case .footer:
                print("footer")
            case .regular12:
                print("regular12")
            case .regular15:
                print("regular15")
            }
        }
    }
    
    func apply(_ styles: [TextFieldStyle], toTextField textField: UITextField) {
        for style in styles {
            switch style {
            case .inputField:
                print("inputField")
            }
        }
    }
    
    func apply(_ styles: [TextViewStyle], toTextView textView: UITextView) {
        for style in styles {
            switch style {
            case .bold(let text):
                print("Bolding all text that matches `\(text)`")
            case .link(let text, let url):
                print("Making all text `\(text)` go to URL `\(url)`")
            case .regular12:
                print("regular12")
            case .regular15:
                print("regular15")
            }
        }
    }
    
    func apply(_ styles: [TableViewStyle], toTableView tableView: UITableView) {
        for style in styles {
            switch style {
            case .simple:
                print("simple")
            }
        }
    }

    func apply(_ styles: [ImageStyle], toImage image: UIImageView) {

    }

    func apply(_ styles: [ViewStyle], toView view: UIView) {

    }

    func apply(_ styles: [ProgressViewStyle], toProgressView progressView: UIProgressView) {

    }
}
