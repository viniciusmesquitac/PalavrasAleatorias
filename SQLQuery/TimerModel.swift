//
//  TimerModel.swift
//  SQLQuery
//
//  Created by Vinicius Mesquita on 07/10/20.
//

import Foundation

protocol TimerDelegate: class {
    func didUpdateTimer(description: String)
    func didFinishTimer(word: String)
}

class TimerModel {
    weak var timer: Timer?
    weak var delegate: TimerDelegate?
    
    var infusionTimeInterval: TimeInterval = 180
    var isRunning = false
    
    private var infusionTimeInMinutes: Int {
        Int(infusionTimeInterval / 60)
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        if let formattedString = formatter.string(from: time) {
            return formattedString
        } else {
            return "--:--"
        }
    }
    
    var timerDescription: String {
        formatTime(infusionTimeInterval)
    }
    
    func setTimer(seconds: Int) {
        self.infusionTimeInterval = TimeInterval(seconds)
        timer?.invalidate()
    }
    
    func setTimer(minutes: Int) {
        self.infusionTimeInterval = TimeInterval(minutes * 60)
        timer?.invalidate()
    }
    
    func setTimer(interval: TimeInterval) {
        self.isRunning = true
        self.infusionTimeInterval = interval
    }
    
    func create(word: String) {
        
        // Cria o Timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in

            //Decrementa os segundos do teaTimer
            self.setTimer(interval: self.infusionTimeInterval - 1)
            
            //Quando o tempo do teaTimer for menor que zero
            if self.infusionTimeInterval < 0 {
                
                //Para o timer
                timer.invalidate()
                self.isRunning = false
                
                self.delegate?.didFinishTimer(word: word)
                
                //Reseta o timer
                self.setTimer(seconds: 5)
            }
            //Seta a informação na label da controller
            self.delegate?.didUpdateTimer(description: self.timerDescription)
        }
        
        //Começa a rodar o timer
        timer?.fire()
    }
    
    
}
