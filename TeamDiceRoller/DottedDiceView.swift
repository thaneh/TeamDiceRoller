//
//  DottedDiceView.swift
//  TeamDiceRoller
//
//  Created by Thane Heninger on 10/31/20.
//

import SwiftUI

struct DotView: View {
    var size = CGFloat(18)
    var body: some View {
        Circle()
            .frame(width: size, height: size)
    }
}

struct ArrangedDots: View {
    let quantity: Int
        
    var leftStack: some View {
        let quantity = DotArrangement(quantity: self.quantity).farSideCount
        return VStack {
            switch quantity {
            case 0:
                EmptyView()
            case 1:
                Spacer()
                DotView()
            default:
                ForEach(1 ..< quantity) { _ in
                    DotView()
                    Spacer()
                }
                DotView()
            }
        }
    }
    
    var rightStack: some View {
        let quantity = DotArrangement(quantity: self.quantity).farSideCount
        return VStack {
            switch quantity {
            case 0:
                EmptyView()
            case 1:
                DotView()
                Spacer()
            default:
                ForEach (1 ..< quantity) { _ in
                    DotView()
                    Spacer()
                }
                DotView()
            }
        }
    }
    
    var centerStack: some View {
        let quantity = DotArrangement(quantity: self.quantity).centerCount
        return VStack {
            switch quantity {
            case 0:
                EmptyView()
            case 1:
                DotView()
            default:
                ForEach (1 ..< quantity) { _ in
                    DotView()
                    Spacer()
                }
                DotView()
            }
        }
    }
    
    var body: some View {
        HStack {
            leftStack
            Spacer()
            centerStack
            Spacer()
            rightStack
        }
        .padding(18)
    }
}

struct DottedDiceView: View {
    let value: Int
    
    var body: some View {
        HStack {
            Image(systemName: "die.face.\(value)")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            RoundedRectangle(cornerRadius: 15.0)
                .inset(by: 4)
                .stroke(lineWidth: 8)
                .overlay(ArrangedDots(quantity: value))
                .frame(width: 100, height: 100)
        }
        .frame(width: 220, height: 100)
    }
}

struct DottedDiceView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(1 ..< 10) {
                DottedDiceView(value: $0)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
