import Foundation
import Nimble
import Quick
import Spry

@testable import ApplicationTheme

import UIKit

private class FakeUITheme<T: UIStyle>: UITheme {
    typealias Style = T
    
    func apply(_ styles: [T.ButtonStyle], toButton button: UIButton) {
        
    }
    
    func apply(_ styles: [T.LabelStyle], toLabel label: UILabel) {
        
    }
    
    func apply(_ styles: [T.TableViewStyle], toTableView tableView: UITableView) {
        
    }
    
    func apply(_ styles: [T.TextFieldStyle], toTextField textField: UITextField) {
        
    }
    
    func apply(_ styles: [T.TextViewStyle], toTextView textView: UITextView) {
        
    }
}

class FakeAnyUITheme<T: UITheme & UITheme>: AnyUITheme<T>, Spryable where T.Style == T {
    
    typealias Style = T
    
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
    
    init() {
        let theme = FakeUITheme<T>()
        super.init(theme: theme)
    }
    
    override func apply(_ styles: [T.ButtonStyle], toButton button: UIButton) {
        return spryify(arguments: styles, button, fallbackValue: Void())
    }
    
    override func apply(_ styles: [T.LabelStyle], toLabel label: UILabel) {
        return spryify(arguments: styles, label, fallbackValue: Void())
    }
    
    override func apply(_ styles: [T.TextFieldStyle], toTextField textField: UITextField) {
        return spryify(arguments: styles, textField, fallbackValue: Void())
    }
    
    override func apply(_ styles: [T.TextViewStyle], toTextView textView: UITextView) {
        return spryify(arguments: styles, textView, fallbackValue: Void())
    }
    
    override func apply(_ styles: [T.TableViewStyle], toTableView tableView: UITableView) {
        return spryify(arguments: styles, tableView, fallbackValue: Void())
    }
}
