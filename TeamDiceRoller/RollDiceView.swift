//
//  RollDiceView.swift
//  TeamDiceRoller
//
//  Created by Clinton Perry on 10/30/20.
//

import SwiftUI


struct RollDiceView: View {
    @State private var numberOfSides = 10
    @State private var numberOfDice = 5
    
    @State private var diceArray = [Int]()
    
    @State private var id = 1
    
    @Environment(\.managedObjectContext) private var viewContext

    func updateDiceValues() {
        id += 1
        diceArray.removeAll()
        for _ in 0..<numberOfDice {
            diceArray.append(Int.random(in: 1...numberOfSides))
        }
        saveDice()
    }
    
    func saveDice(){
        let newItem = DiceRoll(context: viewContext)
        newItem.timestamp = Date()
        newItem.diceValues = diceArray
        try? viewContext.save()
    }
    
    var body: some View {
        VStack {
            DiceView(theDice: diceArray).id(id)
            Stepper("Number of dice (\(numberOfDice))", value: $numberOfDice, in:1...20).padding(.horizontal)
            Stepper("Number of sides (\(numberOfSides))", value: $numberOfSides, in:2...20).padding(.horizontal)
            Button(action: {
                updateDiceValues()
            }, label: {
                Text("Roll Dice")
            })
            .padding()
            Text("Total: \(diceTotal)")
        }.onAppear(perform:updateDiceValues)
    }
    
    var diceTotal: Int {
        return diceArray.reduce(0, +)
    }
}

struct RollDiceView_Previews: PreviewProvider {
    static var previews: some View {
        RollDiceView()
    }
}
