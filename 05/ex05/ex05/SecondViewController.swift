//
//  SecondViewController.swift
//  ex05
//
//  Created by Gennady Evstratov on 3/21/18.
//  Copyright © 2018 TechPark. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func passwordAccepted()
}

class SecondViewController: UIViewController {

    let secretPassword = "123"

    @IBOutlet var passwordField: UITextField!
    @IBOutlet var button: UIButton!
    weak var delegate: SecondViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapButton(_ sender: Any?) {
        guard passwordField.text == secretPassword else {
            let alert = UIAlertController(title: "hey", message: "wrong password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: { _ in

            }))
            present(alert, animated: true, completion: nil)
            return
        }

        delegate?.passwordAccepted()
    }
}
