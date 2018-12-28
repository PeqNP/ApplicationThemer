/**
 The `themer` doesn't exist after some `IBOutlet` get instantiated.
 Some `IBOutlet`s do not exist at `inject` time.
 There needs to be a map between the instantiation of the `IBOutlet` and the setting of the `themer`.
 
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
    
    private var theme = UIThemeApplier()
    
    func inject(themer: UIThemer) {
        theme.themer = themer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
