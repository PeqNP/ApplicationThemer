import Foundation
import Nimble
import Quick
import Spry

@testable import ApplicationTheme

class FakeApplicationThemer: ApplicationThemer, Spryable {
    
    enum ClassFunction: String, StringRepresentable {
        case none
    }
    
    enum Function: String, StringRepresentable {
        case applyLabel = "apply(_:to:)"
    }

    func apply(_ theme: ApplicationLabelTheme, to label: UILabel) {
        return spryify(arguments: theme, label)
    }
    
    func apply(_ theme: ApplicationTextFieldTheme, to textField: UITextField) {
        return spryify(arguments: theme, textField)
    }
    
    func apply(_ theme: ApplicationButtonTheme, to button: UIButton) {
        return spryify(arguments: theme, button)
    }
    
    func apply(_ theme: ApplicationTableViewTheme, to tableView: UITableView) {
        return spryify(arguments: theme, tableView)
    }
}
