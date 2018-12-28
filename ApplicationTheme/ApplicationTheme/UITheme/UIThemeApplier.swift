/**
 Provides coordination to ensure `IBOutlet`, and injected `UITheme`, properties both exist before `*Style`s are applied to respective `UI*` elements.
 
 This also provides a more simple interface to the `UITheme` protocol. The `UITheme.apply*` methods accept an array. This class takes a variadic of styles, which reads much better.
 */

import Foundation
import UIKit

class UIThemeApplier {
    
    var buttonThemes: [([ButtonStyle], UIButton)] = []
    var labelThemes: [([LabelStyle], UILabel)] = []
    var tableViewThemes: [([TableViewStyle], UITableView)] = []
    var textFieldThemes: [([TextViewStyle], UITextView)] = []
    var textViewThemes: [([TextViewStyle], UITextView)] = []
    
    var themer: UIThemer? {
        didSet {
            guard let themer = themer else {
                return
            }
            buttonThemes.forEach { (element) in
                themer.apply(element.0, toButton: element.1)
            }
            buttonThemes = []
            labelThemes.forEach { (element) in
                themer.apply(element.0, toLabel: element.1)
            }
            labelThemes = []
        }
    }
    
    func apply(_ styles: ButtonStyle..., toButton button: UIButton) {
        guard let themer = themer else {
            buttonThemes.append((styles, button))
            return
        }
        themer.apply(styles, toButton: button)
    }
    
    func apply(_ styles: LabelStyle..., toLabel label: UILabel) {
        guard let themer = themer else {
            labelThemes.append((styles, label))
            return
        }
        themer.apply(styles, toLabel: label)
    }
    
    func apply(_ styles: TableViewStyle..., toTableView tableView: UITableView) {
        
    }
    
    func apply(_ styles: TextFieldStyle..., toTextField textField: UITextField) {
        
    }
    
    func apply(_ styles: TextViewStyle..., toTextView textView: UITextView) {
        
    }
}
