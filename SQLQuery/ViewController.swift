//
//  ViewController.swift
//  TestSQLQuery
//
//  Created by Vinicius Mesquita on 06/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    private var timer = TimerModel()
    private let db = DBReader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer.delegate = self
        
        // Tempo em segundos padrão para o timer.
        timer.infusionTimeInterval = 5
        
        do {
            try db.start()
        } catch {
            print(error)
        }
    }
    
    
    @IBAction func randomWord(_ sender: Any) {
        
        let character = textField.text!.uppercased()
        guard let word = db.random(character: character) else { return }
        
        // Verifica se o timer ainda esta rodando.
        if !timer.isRunning {
            // Inicia uma nova contagem.
            timer.create(word: word)
        }
    }
    
}


extension ViewController: TimerDelegate {
    
    func didUpdateTimer(description: String) {
        self.timerLabel.text = description
    }
    
    func didFinishTimer(word: String) {
        self.label.text = word
        print("Finish")
    }
    
    
}
