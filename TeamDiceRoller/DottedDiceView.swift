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

struct DotStack: View {
    let arrangement: [Bool]
    let height: CGFloat
    let smallDots: Bool
    
    var dotSpacing: CGFloat {
        let spacing = (height - 18 * 5) / 4
        print("dotSpacing(height: \(height)): \(spacing)")
        return spacing
    }
    
    var body: some View {
        VStack(spacing: dotSpacing) {
            if arrangement[0] {
                DotView(size: smallDots ? 9 : 18)
            } else {
                EmptyView()
            }
            ForEach(arrangement.dropFirst(), id: \.self) {
                Spacer()
                if $0 {
                    DotView(size: smallDots ? 9 : 18)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

struct ArrangedDots: View {
    let quantity: Int
    
    func hasDots(dots: [Bool]) -> Bool {
        !DotArrangement.allFalse(dots)
    }
    
    var firstStack: [Bool] {
        DotArrangement(quantity: quantity).farLeftDots
    }
    
    var stacksExceptFirst: [[Bool]] {
        let arrangement = DotArrangement(quantity: quantity)
        return [arrangement.midLeftDots,
                arrangement.centerDots,
                arrangement.midRightDots,
                arrangement.farRightDots]
    }
    
    func stackSpacing(from totalWidth: CGFloat) -> CGFloat {
        let spacing = (totalWidth - 18 * 6) / 4
        print("stackSpacing(from: \(totalWidth)) -> \(spacing)")
        return spacing
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: stackSpacing(from: geo.size.width)) {
                if hasDots(dots: firstStack) {
                    DotStack(arrangement: firstStack,
                             height: geo.size.height,
                             smallDots: quantity > 9)
                } else {
                    EmptyView()
                }
                ForEach(stacksExceptFirst, id: \.self) {
                    Spacer()
                    if hasDots(dots: $0) {
                        DotStack(arrangement: $0,
                                 height: geo.size.height,
                                 smallDots: quantity > 9)
                    } else {
                        EmptyView()
                    }
                }
            }
        }
        .padding(16)
    }
}

struct DottedDiceView: View {
    let value: Int
    
    var body: some View {
        HStack {
            if value <= 6 {
                Image(systemName: "die.face.\(value)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } else {
                Text("\(value)").font(.largeTitle)
            }
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
            ForEach(1 ..< 26) {
                DottedDiceView(value: $0)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
