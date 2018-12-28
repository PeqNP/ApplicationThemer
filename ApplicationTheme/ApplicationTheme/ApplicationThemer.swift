/**
 Define your application, or module's, themes here.
 
 Copyright © 2018 Upstart Illustration LLC. All rights reserved.
 */

import Foundation
import UIKit

protocol UIThemer {
    func apply(_ styles: [ButtonStyle], toButton button: UIButton)
    func apply(_ styles: [LabelStyle], toLabel label: UILabel)
    func apply(_ styles: [TableViewStyle], toTableView tableView: UITableView)
    func apply(_ styles: [TextFieldStyle], toTextField textField: UITextField)
    func apply(_ styles: [TextViewStyle], toTextView textView: UITextView)
}

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
