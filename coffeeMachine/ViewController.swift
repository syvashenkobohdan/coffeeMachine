

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var firstDrinkButton: UIButton!
    @IBOutlet weak var secondDrinkButton: UIButton!
    @IBOutlet weak var thirdDrinkButton: UIButton!
    @IBOutlet weak var fourthDrinkButton: UIButton!
    @IBOutlet weak var fifthDrinkButton: UIButton!
    @IBOutlet weak var sixthDrinkButton: UIButton!
    @IBOutlet weak var seventhDrinkButton: UIButton!
    @IBOutlet weak var eighthDrinkButton: UIButton!
    @IBOutlet weak var ninthDrinkButton: UIButton!
    @IBOutlet weak var moneyHas: UILabel!
    
    @IBOutlet weak var bar: UIProgressView!
    @IBOutlet weak var water: UIButton!
    @IBOutlet weak var coffee: UIButton!
    @IBOutlet weak var milk: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = "Please insert money"
        firstDrinkButton.setTitle(coffeeBrain.returnName(drink: .latte), for: .normal)
        secondDrinkButton.setTitle(coffeeBrain.returnName(drink: .cappucino), for: .normal)
        thirdDrinkButton.setTitle(coffeeBrain.returnName(drink: .espresso), for: .normal)
        fourthDrinkButton.setTitle(coffeeBrain.returnName(drink: .greenTea), for: .normal)
        fifthDrinkButton.setTitle(coffeeBrain.returnName(drink: .blackTea), for: .normal)
        sixthDrinkButton.setTitle(coffeeBrain.returnName(drink: .flatWhite), for: .normal)
        seventhDrinkButton.setTitle(coffeeBrain.returnName(drink: .hotChocolade), for: .normal)
        eighthDrinkButton.setTitle(coffeeBrain.returnName(drink: .irishWhiskey), for: .normal)
        ninthDrinkButton.setTitle(coffeeBrain.returnName(drink: .blackTea), for: .normal)
    }
    var counter = 0
    var timeNeeded = 0
    var timer = Timer()
    var coffeeBrain = CoffeeMachine()
    let stockTags : [Int : CoffeeMachine.StockItems] = [1 : .milk, 2 : .coffee, 3 : .water]
    let drinksTsg : [Int : CoffeeMachine.drinks] = [1 : .latte, 2 : .cappucino, 3 : .espresso, 4 : .blackTea, 5 : .greenTea, 6 : .flatWhite, 7 : .hotChocolade, 8 : .irishWhiskey]
    var cashAmount : Double = 0.0
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        coffeeBrain.putMoney(amount: cashAmount)
        display.text = "You're balance : \(Int(coffeeBrain.moneyInVendor))$"
        stepper.value = 0
        cashAmount = 0
        moneyHas.text = "Money: \(Int(coffeeBrain.money))$"
    }
    
    @IBAction func earnCash(_ sender: UIButton) {
        display.text = coffeeBrain.makeSomeCash()
        stepper.value = 0
        moneyHas.text = "Money: \(Int(coffeeBrain.money))$"
        stepper.maximumValue = coffeeBrain.money
    }
    
    @IBAction func cashStepper(_ sender: UIStepper) {
        cashAmount = stepper.value <= coffeeBrain.money ? stepper.value : 0
        display.text = "Put \(Int(cashAmount))$ ?"
        stepper.maximumValue = coffeeBrain.money
        
        
    }
    
    @IBAction func restock(_ sender: UIButton) {
        display.text = coffeeBrain.reStock(stockItem: stockTags[sender.tag] ?? .water)
        sender.isHidden = true
        
        
    }
    
  
    
    @IBAction func drinkChosen(_ sender: UIButton)  {
        timer.invalidate()
        display.text = coffeeBrain.makeDrink(drink: drinksTsg[sender.tag] ?? .latte)
        timeNeeded = coffeeBrain.returnTime(drink: drinksTsg[sender.tag] ?? .latte)
        guard ((display.text!.contains("prepared"))) else {return}
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        bar.isHidden = false
       
    }
    
    @objc func timerAction() {
        if counter < timeNeeded{
            counter += 1
            bar.progress = Float(counter) / Float(timeNeeded)
            
        } else {
            timer.invalidate()
            bar.progress = 0
            bar.isHidden = true
            display.text = "Your Drink is hot and ready!"
            counter = 0
            
        }
        }
    
}
