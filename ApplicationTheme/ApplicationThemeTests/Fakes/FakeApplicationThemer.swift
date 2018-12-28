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
        case applyToButton = "apply(_:toButton:)"
        case applyToLabel = "apply(_:toLabel:)"
        case applyToTextField = "apply(_:toTextField:)"
        case applyToTextView = "apply(_:toTextView:)"
        case applyToTableView = "apply(_:toTableView:)"
    }

    func apply(_ themes: ButtonTheme..., toButton button: UIButton) {
        return spryify(arguments: themes, button, fallbackValue: Void())
    }
    
    func apply(_ themes: LabelTheme..., toLabel label: UILabel) {
        return spryify(arguments: themes, label, fallbackValue: Void())
    }
    
    func apply(_ themes: TextFieldTheme..., toTextField textField: UITextField) {
        return spryify(arguments: themes, textField, fallbackValue: Void())
    }
    
    func apply(_ themes: TextViewTheme..., toTextView textView: UITextView) {
        return spryify(arguments: themes, textView, fallbackValue: Void())
    }
    
    func apply(_ themes: TableViewTheme..., toTableView tableView: UITableView) {
        return spryify(arguments: themes, tableView, fallbackValue: Void())
    }
}
