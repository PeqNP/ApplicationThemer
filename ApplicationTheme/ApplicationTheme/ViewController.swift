/**
 Why do we need the `UIThemeApplier`?
 - Sometimes `themer` doesn't exist at the time the `IBOutlet` is instantiated -- so the app crashes.
 - Sometimes the `IBOutlet` doesn't exist at the time `themer` is injected -- so the app crashes.
 
 Therefore, there needs to be a way to reconcile when one or the other doesn't exist and map the respective styles when they both exist. The `UIThemeApplier` provides this.
 
 Copyright © 2018 Upstart Illustration LLC. All rights reserved.
 */

import UIKit

class ViewController: UIViewController {

    enum ViewID: ViewIdentifiable {
        case nameLabel
        case nameTextField
        case submitButton
        case tableView
        case logTextView
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.identifier = ViewID.nameLabel
            theme.apply(.inputField, toLabel: nameLabel)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.identifier = ViewID.nameTextField
            theme.apply(.inputField, toTextField: nameTextField)
        }
    }
    
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.identifier = ViewID.submitButton
            theme.apply(.primary, toButton: submitButton)
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.identifier = ViewID.tableView
            tableView.dataSource = self
            theme.apply(.simple, toTableView: tableView)
        }
    }
    
    @IBOutlet weak var logTextView: UITextView! {
        didSet {
            logTextView.identifier = ViewID.logTextView
            theme.apply(.regular15, .bold(text: "bold"), toTextView: logTextView)
        }
    }
    
    private var theme = UIThemeApplier<AppTheme>()
    
    func inject(theme: AnyUITheme<AppTheme>) {
        self.theme.concrete = theme
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
