//
//  DiceView.swift
//  TeamDiceRoller
//
//  Created by Jim Norman on 10/30/20.
//

import SwiftUI

struct DieView: View {
    let dieValue: Int
    var body: some View {
        Image(systemName: "die.face.\(dieValue)").font(.largeTitle)
    }
}


struct DiceView: View {
    
    private var diceValues:String {
        theDice.debugDescription
    }

    let theDice: [Int]
    let columns = [GridItem(.fixed(30)), GridItem(.fixed(30)), GridItem(.fixed(30)), GridItem(.fixed(30)), GridItem(.fixed(30)) ]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5) {
            ForEach(0..<theDice.count, id:\.self)  {
                DieView(dieValue: theDice[$0])
            }
            
            
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(theDice: [1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 7, 1])
    }
}
