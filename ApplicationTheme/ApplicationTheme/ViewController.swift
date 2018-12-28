/**
 
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
            themer.apply(.inputField, toLabel: nameLabel)
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.identifier = ViewID.nameTextField
            themer.apply(.inputField, toTextField: nameTextField)
        }
    }
    
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.identifier = ViewID.submitButton
            themer.apply(.primary, toButton: submitButton)
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.identifier = ViewID.tableView
            themer.apply(.simple, toTableView: tableView)
            tableView.dataSource = self
        }
    }
    
    @IBOutlet weak var logTextView: UITextView! {
        didSet {
            logTextView.identifier = ViewID.logTextView
            themer.apply(.regular15, .bold(text: "bold"), toTextView: logTextView)
        }
    }
    
    private var themer: ApplicationThemer!
    
    func inject(themer: ApplicationThemer) {
        self.themer = themer
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
