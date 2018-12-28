/**
 Provides coordination to ensure `IBOutlet`, and injected `UITheme`, properties both exist before `*Style`s are applied to respective `UI*` elements.
 
 This also provides a more simple interface to the `UITheme` protocol. The `UITheme.apply*` methods accept an array. This class takes a variadic of styles, which reads much better.
 */

import Foundation
import UIKit

class UIThemeApplier<T: UITheme & UITheme> where T.Style == T {
    
    var buttonThemes: [([T.ButtonStyle], UIButton)] = []
    var labelThemes: [([T.LabelStyle], UILabel)] = []
    var tableViewThemes: [([T.TableViewStyle], UITableView)] = []
    var textFieldThemes: [([T.TextViewStyle], UITextView)] = []
    var textViewThemes: [([T.TextViewStyle], UITextView)] = []
    
    var concrete: AnyUITheme<T>? {
        didSet {
            buttonThemes.forEach { (element) in
                concrete?.apply(element.0, toButton: element.1)
            }
            buttonThemes = []
            labelThemes.forEach { (element) in
                concrete?.apply(element.0, toLabel: element.1)
            }
            labelThemes = []
        }
    }
    
    func apply(_ styles: T.ButtonStyle..., toButton button: UIButton) {
        guard let theme = concrete else {
            buttonThemes.append((styles, button))
            return
        }
        theme.apply(styles, toButton: button)
    }
    
    func apply(_ styles: T.LabelStyle..., toLabel label: UILabel) {
        guard let theme = concrete else {
            labelThemes.append((styles, label))
            return
        }
        theme.apply(styles, toLabel: label)
    }
    
    func apply(_ styles: T.TableViewStyle..., toTableView tableView: UITableView) {
        
    }
    
    func apply(_ styles: T.TextFieldStyle..., toTextField textField: UITextField) {
        
    }
    
    func apply(_ styles: T.TextViewStyle..., toTextView textView: UITextView) {
        
    }
}
