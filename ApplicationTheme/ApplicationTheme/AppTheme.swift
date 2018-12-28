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
}

extension AppTheme: UITheme {
    typealias Style = AppTheme
    
    func apply(_ styles: [ButtonStyle], toButton button: UIButton) {
        for style in styles {
            switch style {
            case .primary:
                print("primary")
            case .secondary:
                print("secondary")
            case .tertiary:
                print("tertiary")
            }
        }
    }
    
    func apply(_ styles: [LabelStyle], toLabel label: UILabel) {
        
    }
    
    func apply(_ styles: [TextFieldStyle], toTextField textField: UITextField) {
        
    }
    
    func apply(_ styles: [TextViewStyle], toTextView textView: UITextView) {
        
    }
    
    func apply(_ styles: [TableViewStyle], toTableView tableView: UITableView) {
        
    }
}
