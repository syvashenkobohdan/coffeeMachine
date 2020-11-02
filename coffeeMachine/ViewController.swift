//
//  ViewController.swift
//  Khudolii_HW4
//
//  Created by Yevhenii on 06.10.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var water: UIButton!
    @IBOutlet weak var coffee: UIButton!
    @IBOutlet weak var milk: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = "Please insert money"
        
        
    }
    var coffeeBrain = CoffeeMachine()
    var cashAmount : Double = 0.0
    @IBAction func buttonPressed(_ sender: UIButton) {
        coffeeBrain.putMoney(amount: cashAmount)
    }
    
    @IBAction func earnCash(_ sender: UIButton) {
        coffeeBrain.makeSomeCash()
    }
    @IBAction func cashStepper(_ sender: UIStepper) {
        cashAmount = stepper.value <= coffeeBrain.money ? stepper.value : 0
        display.text = stepper.value <= coffeeBrain.money ?  "Put \(Int(cashAmount))$ ?" : "Not enought money!"
        
    }
    @IBAction func milkRefill(_ sender: UIButton) {
        coffeeBrain.reStock(stockItem: .milk)
        if coffeeBrain.stock[.milk]! == coffeeBrain.maxCapacityReturn(stockItem: .milk){
            milk.isHidden = true
        }
    }
    @IBAction func coffeeRefill(_ sender: UIButton) {
        coffeeBrain.reStock(stockItem: .coffee)
        if coffeeBrain.stock[.coffee]! == coffeeBrain.maxCapacityReturn(stockItem: .coffee){
            coffee.isHidden = true
        }
    }
    @IBAction func waterRefill(_ sender: UIButton) {
        coffeeBrain.reStock(stockItem: .water)
        if coffeeBrain.stock[.water]! == coffeeBrain.maxCapacityReturn(stockItem: .water){
            water.isHidden = true
            
        }
    }
}
