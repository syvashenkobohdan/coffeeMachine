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
        return "WOW! You earned \(money)$"
    }
    
    mutating func putMoney(amount: Double) -> String {
        money -= amount
        moneyInVendor += amount
        return "5$ in"
    }
    
    func maxCapacityReturn(stockItem: StockItems) -> Double {
        return stockItem.maxCapacity
    }
    }
