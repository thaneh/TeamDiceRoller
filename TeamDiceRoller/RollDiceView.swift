//
//  RollDiceView.swift
//  TeamDiceRoller
//
//  Created by Clinton Perry on 10/30/20.
//

import SwiftUI


struct RollDiceView: View {
    @State private var numberOfSides = 6
    @State private var numberOfDice = 2
    
    @State private var diceArray = [Int]()
    
    func updateDiceValues() {
        diceArray.removeAll()
        for _ in 0..<numberOfDice {
            diceArray.append(Int.random(in: 1...numberOfSides))
        }
    }
    
    private var diceValues:String {
        diceArray.debugDescription
    }
    
    var body: some View {
        VStack {
            Text("\(diceValues)")
            Stepper("Number of dice (\(numberOfDice))", value: $numberOfDice, in:1...10).padding(.horizontal)
            Stepper("Number of sides (\(numberOfSides))", value: $numberOfSides, in:2...20).padding(.horizontal)
            Button(action: {
                updateDiceValues()
            }, label: {
                Text("Roll Dice")
            })
        }.onAppear(perform:updateDiceValues)
    }
}

struct RollDiceView_Previews: PreviewProvider {
    static var previews: some View {
        RollDiceView()
    }
}
