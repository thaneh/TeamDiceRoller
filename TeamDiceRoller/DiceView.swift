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
            if (displayNum <= 6) {
                Image(systemName: "die.face.\(displayNum)")
                    .resizable()
                    .frame(width: size, height: size)
            } else {
                Text("\(displayNum)")
                    .frame(width: size, height: size)
                    .background(Color.clear)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
                    .clipShape(RoundedRectangle(cornerRadius: 6.0))
            }
        }
        .onChange(of: dieValue, perform: { newValue in
            displayNum = 1
            doAnim(newValue: newValue)
        })
    }
    
    func doAnim (newValue: Int, _ time:Double = 0.1) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            if (displayNum < newValue) {
                displayNum += 1
                
                doAnim(newValue: newValue, Double(displayNum) / 20)
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
