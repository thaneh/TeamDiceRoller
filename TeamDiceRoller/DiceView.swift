//
//  DiceView.swift
//  TeamDiceRoller
//
//  Created by Jim Norman on 10/30/20.
//

import SwiftUI

struct DieView: View {
    let dieValue: Int
    let size:CGFloat = 30.0
    
    @State private var displayNum:Int = 1
    
    var body: some View {
        
        Group {
//            if (displayNum <= 6) {
//                Image(systemName: "die.face.\(displayNum)")
//                    .resizable()
//                    .frame(width: size, height: size)
//            } else {
                Text("\(displayNum)")
                    .frame(width: size, height: size)
                    .background(Color.clear)
                    .border(Color(.label), width: 3)
                    .clipShape(RoundedRectangle(cornerRadius: 6.0))
        }.onAppear {
            doAnim(newValue: dieValue)
        }
    }
    
    func doAnim (newValue: Int, _ time:Double = 0.1) {
        for i in 1...10  {
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(i * i) / 100) {
                if (i == 10) {
                    displayNum = newValue
                } else {
                    displayNum = Int.random(in: 1...10)
                }
            }
        }
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
        DiceView(theDice: [1, 2, 3, 4, 5, 6, 1, 2, 3, 144, 7, 31])
    }
}
