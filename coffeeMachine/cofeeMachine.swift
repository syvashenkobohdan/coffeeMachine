//
//  cofeeMachine.swift
//  coffeeMachine
//
//  Created by Богдан Сивашенко on 27.10.2020.
//

import Foundation
 
struct CoffeeMachine {
    
    enum drinks {
        case latte, cappucino, espresso, blackTea, greenTea, flatWhite, hotChocolade, irishWhiskey
        
        var name : String {
            switch self {
            case .latte: return "Latte"
            case .cappucino: return "Cappucino"
            case .espresso: return "Espresso"
            case .blackTea: return "Black Tea"
            case .greenTea: return "Green Tea"
            case .flatWhite: return "Flat white"
            case .hotChocolade: return "Hot Chocolade"
            case .irishWhiskey: return "Irish Whiskey"
            }
        }
        
        var coffeeNeeded : Double {
            switch self {
            case .latte: return 30
            case .cappucino: return 50
            case .espresso: return 40
            case .blackTea: return 0
            case .greenTea: return 0
            case .flatWhite: return 60
            case .hotChocolade: return 0
            case .irishWhiskey: return 100
            }
        }
        
        var waterNeeded : Double {
            switch self {
            case .latte: return 30
            case .cappucino: return 50
            case .espresso: return 40
            case .blackTea: return 20
            case .greenTea: return 50
            case .flatWhite: return 50
            case .hotChocolade: return 30
            case .irishWhiskey: return 50
            }
        }
        
        var milkNeeded : Double {
            switch self {
            case .latte: return 50
            case .cappucino: return 40
            case .espresso: return 30
            case .blackTea: return 0
            case .greenTea: return 0
            case .flatWhite: return 50
            case .hotChocolade: return 0
            case .irishWhiskey: return 50
            }
        }
        
        var greenTeaNeeded : Double {
            switch self {
            case .latte: return 0
            case .cappucino: return 0
            case .espresso: return 0
            case .blackTea: return 0
            case .greenTea: return 1
            case .flatWhite: return 0
            case .hotChocolade: return 0
            case .irishWhiskey: return 0
            }
        }
        
        var blackTeaNeeded : Double {
            switch self {
            case .latte: return 0
            case .cappucino: return 0
            case .espresso: return 0
            case .blackTea: return 1
            case .greenTea: return 0
            case .flatWhite: return 0
            case .hotChocolade: return 0
            case .irishWhiskey: return 0
            }
        }
        
        var chocoladeNeeded : Double {
            switch self {
            case .latte: return 0
            case .cappucino: return 0
            case .espresso: return 0
            case .blackTea: return 0
            case .greenTea: return 0
            case .flatWhite: return 0
            case .hotChocolade: return 200
            case .irishWhiskey: return 0
            }
        }
        
        var whiskeyNeeded : Double {
            switch self {
            case .latte: return 0
            case .cappucino: return 0
            case .espresso: return 0
            case .blackTea: return 0
            case .greenTea: return 0
            case .flatWhite: return 0
            case .hotChocolade: return 0
            case .irishWhiskey: return 50
            }
        }
        
        var moneyNeeded : Double {
            switch self {
            case .latte: return 5
            case .cappucino: return 10
            case .espresso: return 15
            case .blackTea: return 20
            case .greenTea: return 40
            case .flatWhite: return 60
            case .hotChocolade: return 80
            case .irishWhiskey: return 200
            }
        }
        
        var timeNeeded : Int {
            switch self {
            case .latte: return 10
            case .cappucino: return 15
            case .espresso: return 20
            case .blackTea: return 5
            case .greenTea: return 5
            case .flatWhite: return 20
            case .hotChocolade: return 12
            case .irishWhiskey: return 10
            }
        }
    }
    
    enum StockItems {
        case water, milk, coffee, blackTea, greenTea, chocolade, whiskey
        
        var name : String {
            switch self {
            case .water: return "Water"
            case .milk: return "Milk"
            case .coffee: return "100 % *** Coffee Beans"
            case .blackTea: return "Black Tea"
            case .greenTea: return "Green Tea"
            case .chocolade: return "Chocolade powder"
            case .whiskey: return "Whiskey - 'Blue Label' "
            }
        }
        
        var maxCapacity : Double {
            switch self {
            case .water: return 10000
            case .milk: return 5000
            case .coffee: return 2500
            case .blackTea: return 20
            case .greenTea: return 20
            case .chocolade: return 2000
            case .whiskey: return 1000
            }
        }
    }
    
    var stock : [StockItems : Double]
    var money : Double
    var moneyInVendor : Double
    
    
    
    init() {
        stock = [.water : 0, .blackTea : 0, .greenTea : 0, .milk : 0, .whiskey : 0, .chocolade : 0, .coffee : 0]
        money = 0
        moneyInVendor = 0
    }
    
    mutating func reStock(stockItem: StockItems) -> String {
        stock[stockItem] = stockItem.maxCapacity
        return "\(stockItem.name) has been refilled"
    }
    
    mutating func makeSomeCash() -> String {
        money += 100
        return "WOW! You now have \(money)$"
    }
    
    mutating func putMoney(amount: Double)  {
        money -= amount
        moneyInVendor += amount
        
    }
    
    func maxCapacityReturn(stockItem: StockItems) -> Double {
        return stockItem.maxCapacity
    }
    
    mutating func makeDrink(drink: drinks) -> String {
        guard moneyInVendor >= drink.moneyNeeded else {return "Not enought money. You need \(Int(drink.moneyNeeded - moneyInVendor))$ more. "}
        guard stock[.water] ?? 0 >= drink.waterNeeded else {return "Not enought \(StockItems.water.name). You need to refill it"}
        guard stock[.milk] ?? 0 >= drink.milkNeeded else {return "Not enought \(StockItems.milk.name). You need to refill it"}
        guard stock[.coffee] ?? 0 >= drink.coffeeNeeded else {return "Not enought \(StockItems.coffee.name). You need to refill it"}
        guard stock[.chocolade] ?? 0 >= drink.chocoladeNeeded else {return "Not enought \(StockItems.chocolade.name). You need to refill it "}
        guard stock[.greenTea] ?? 0 >= drink.greenTeaNeeded else {return "Not enought \(StockItems.greenTea.name). You need to refill it"}
        guard stock[.blackTea] ?? 0 >= drink.blackTeaNeeded else {return "Not enought \(StockItems.blackTea.name). You need to refill it"}
        guard stock[.whiskey] ?? 0 >= drink.whiskeyNeeded else {return "Not enought \(StockItems.whiskey.name). You need to refill it"}
        
        moneyInVendor -= drink.moneyNeeded
        stock[.water]! -= drink.waterNeeded
        stock[.milk]! -= drink.milkNeeded
        stock[.coffee]! -= drink.coffeeNeeded
        stock[.chocolade]! -= drink.chocoladeNeeded
        stock[.greenTea]! -= drink.greenTeaNeeded
        stock[.blackTea]! -= drink.blackTeaNeeded
        stock[.whiskey]! -= drink.whiskeyNeeded
        return "You're \(drink.name) is being prepared"
    }
    
    func returnTime(drink: drinks) -> Int {
        return drink.timeNeeded
    }
    
    func returnName(drink: drinks) -> String {
        return drink.name
    }
    
    
}
