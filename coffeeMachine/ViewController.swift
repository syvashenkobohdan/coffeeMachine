

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
    let stockTags : [Int:CoffeeMachine.StockItems] = [1 : .milk, 2 : .coffee, 3 : .water]
    var cashAmount : Double = 0.0
    @IBAction func buttonPressed(_ sender: UIButton) {
        coffeeBrain.putMoney(amount: cashAmount)
        display.text = "You're balance : \(Int(coffeeBrain.moneyInVendor))$"
        stepper.value = 0
        cashAmount = 0
    }
    @IBAction func earnCash(_ sender: UIButton) {
        display.text = coffeeBrain.makeSomeCash()
    }
    @IBAction func cashStepper(_ sender: UIStepper) {
        cashAmount = stepper.value <= coffeeBrain.money ? stepper.value : 0
        display.text = stepper.value <= coffeeBrain.money ?  "Put \(Int(cashAmount))$ ?" : "Not enought money!"
        
        
    }
    @IBAction func restock(_ sender: UIButton) {
        display.text = coffeeBrain.reStock(stockItem: stockTags[sender.tag] ?? .water)
        sender.isHidden = true
        
        
    }
    
  
    
    @IBAction func drinkChosen(_ sender: UIButton) {
        display.text = coffeeBrain.makeDrink(drink: .cappucino)
    }
    
}
