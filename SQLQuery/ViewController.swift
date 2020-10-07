//
//  ViewController.swift
//  TestSQLQuery
//
//  Created by Vinicius Mesquita on 06/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    private let db = DBReader()
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try db.start()
        } catch {
            print(error)
        }
    }


    @IBAction func randomWord(_ sender: Any) {
        let character = textField.text!.uppercased()
        let word = db.random(character: character)
        label.text = word
    }
}

