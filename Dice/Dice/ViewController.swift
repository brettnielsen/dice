//
//  ViewController.swift
//  Dice
//
//  Created by Brett Nielsen on 4/16/20.
//  Copyright © 2020 Brett Nielsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    @IBOutlet weak var dice3: UIImageView!
    @IBOutlet weak var dice4: UIImageView!
    @IBOutlet weak var dice5: UIImageView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var diceTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper.value = 1;
        stepper.minimumValue = 1;
        stepper.maximumValue = 5;
    }


    @IBAction func rollDice(_ sender: Any) {
        var total = 0;
        self.diceTotal.text = "0";
        for index in 1...Int(self.stepper.value) {
            let number = (1...6).randomElement()!
            total += number;
            let diceView = self.getDiceView(diceNumber: Int(index));
            diceView.image = UIImage(named: "dice-\(number)")
        }
        
        self.diceTotal.text = String(total);
    }
    
    
    @IBAction func toggleDiceAmount(_ sender: UIStepper) {
        switch(Int(sender.value).description) {
        case "5":
            self.dice5.isHidden = false;
        
        case "4":
            self.dice4.isHidden = false;
            self.dice5.isHidden = true;
        
        case "3":
            self.dice3.isHidden = false;
            self.dice4.isHidden = true;
        
        case "2":
            self.dice2.isHidden = false;
            self.dice3.isHidden = true;
        
        default:
            self.diceImageView.isHidden = false;
            self.dice2.isHidden = true;
        }
    }
    
    func getDiceView(diceNumber: Int) -> UIImageView{
        switch(diceNumber) {
        case 1:
            return self.diceImageView;
        case 2:
            return self.dice2;
        case 3:
            return self.dice3;
        case 4:
            return self.dice4;
        default:
            return self.dice5;
        }
    }
}

