/**
 Provides a generic interface to any `UITheme`.
 
 This is used for tests. Tests can now inject the `UITheme` type into a class and determine if themes were applied. Otherwise, this class is _not_ necessary.
 */

import Foundation
import UIKit

class AnyUITheme<T: UIStyle>: UITheme {
    typealias Style = T
    
    let _applyButton: ([T.ButtonStyle], UIButton) -> Void
    let _applyLabel: ([T.LabelStyle], UILabel) -> Void
    
    init<U: UITheme>(theme: U) where U.Style == T {
        _applyButton = theme.apply(_:toButton:)
        _applyLabel = theme.apply(_:toLabel:)
    }
    
    func apply(_ styles: [T.ButtonStyle], toButton button: UIButton) {
        _applyButton(styles, button)
    }
    
    func apply(_ styles: [T.LabelStyle], toLabel label: UILabel) {
        _applyLabel(styles, label)
    }
    
    func apply(_ styles: [T.TableViewStyle], toTableView tableView: UITableView) {
        
    }
    
    func apply(_ styles: [T.TextFieldStyle], toTextField textField: UITextField) {
        
    }
    
    func apply(_ styles: [T.TextViewStyle], toTextView textView: UITextView) {
        
    }
}