/**
 Define your application, or module's, themes here.
 
 Copyright © 2018 Upstart Illustration LLC. All rights reserved.
 */

import Foundation
import UIKit

protocol ApplicationThemer {
    func apply(_ themes: ButtonTheme..., toButton button: UIButton)
    func apply(_ themes: LabelTheme..., toLabel label: UILabel)
    func apply(_ themes: TableViewTheme..., toTableView tableView: UITableView)
    func apply(_ themes: TextFieldTheme..., toTextField textField: UITextField)
    func apply(_ themes: TextViewTheme..., toTextView textView: UITextView)
}

enum ButtonTheme {
    case primary
    case secondary
    case tertiary
}

enum LabelTheme {
    case inputField
    case footer
    case regular12
    case regular15
}

enum TableViewTheme {
    case simple
}

enum TextFieldTheme {
    case inputField
}

enum TextViewTheme {
    case regular12
    case regular15
    case bold(text: String)
    case link(text: String, url: URL)
}
