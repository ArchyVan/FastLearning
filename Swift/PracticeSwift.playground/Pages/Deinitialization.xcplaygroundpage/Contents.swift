//: [Previous](@previous)

import Foundation

//deinit {
//
//}

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playOne : Player? = Player(coins: 100)
print("A new player has joined the game with \(playOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")

playOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playOne!.coinsInPurse) coins")
print("The bank now only has \(Bank.coinsInBank) coins left")

playOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")


		