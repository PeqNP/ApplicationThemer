/**
 Define your application, or module's, themes here.
 
 Copyright © 2018 Upstart Illustration LLC. All rights reserved.
 */

import Foundation
import UIKit

enum ApplicationLabelTheme {
    case inputField
    case footer
}

enum ApplicationTextFieldTheme {
    case inputField
}

enum ApplicationButtonTheme {
    case primary
    case secondary
}

enum ApplicationTableViewTheme {
    case main
}

protocol ApplicationThemer {
    func apply(_ theme: ApplicationLabelTheme, to label: UILabel)
    func apply(_ theme: ApplicationTextFieldTheme, to textField: UITextField)
    func apply(_ theme: ApplicationButtonTheme, to button: UIButton)
    func apply(_ theme: ApplicationTableViewTheme, to tableView: UITableView)
}
