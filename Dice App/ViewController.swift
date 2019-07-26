//
//  ViewController.swift
//  Dice App
//
//  Created by chrisman on 24/07/19.
//  Copyright © 2019 chrisman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDice: UIImageView!
    @IBOutlet weak var rightDice: UIImageView!
    @IBOutlet weak var buttonProperti: UIButton!
    var statusRoll:Bool=false
    var randomNumberDice1:Int=1
    var randomNumberDice2:Int=1
    var timerTest : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        randomDice()
        // Do any additional setup after loading the view.
    }

    @objc func randomDice(){
        randomNumberDice1 = Int.random(in: 1...6)
        randomNumberDice2 = Int.random(in: 1...6)
        
        leftDice.image = UIImage(named: "dice\(randomNumberDice1)")
        rightDice.image = UIImage(named: "dice\(randomNumberDice2)")
    }

    @IBAction func rollPress(_ sender: UIButton) {
        if !statusRoll{
            buttonProperti.setTitle("Stop", for: .normal)
            guard timerTest == nil else { return }

              timerTest =  Timer.scheduledTimer(
                  timeInterval: TimeInterval(0.3),
                  target      : self,
                  selector    : #selector(ViewController.randomDice),
                  userInfo    : nil,
                  repeats     : true)
            statusRoll=true
        
        }else{
            buttonProperti.setTitle("Roll", for: .normal)
            timerTest?.invalidate()
            timerTest = nil
            statusRoll=false
            
        }
        

        
    }
    
}

