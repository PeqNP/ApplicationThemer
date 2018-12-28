import Foundation
import Nimble
import Quick
import Spry

@testable import ApplicationTheme

class FakeUIThemer: UIThemer, Spryable {
    
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

    func apply(_ styles: [ButtonStyle], toButton button: UIButton) {
        return spryify(arguments: styles, button, fallbackValue: Void())
    }
    
    func apply(_ styles: [LabelStyle], toLabel label: UILabel) {
        return spryify(arguments: styles, label, fallbackValue: Void())
    }
    
    func apply(_ styles: [TextFieldStyle], toTextField textField: UITextField) {
        return spryify(arguments: styles, textField, fallbackValue: Void())
    }
    
    func apply(_ styles: [TextViewStyle], toTextView textView: UITextView) {
        return spryify(arguments: styles, textView, fallbackValue: Void())
    }
    
    func apply(_ styles: [TableViewStyle], toTableView tableView: UITableView) {
        return spryify(arguments: styles, tableView, fallbackValue: Void())
    }
}
