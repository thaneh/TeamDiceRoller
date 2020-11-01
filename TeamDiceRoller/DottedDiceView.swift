//
//  DottedDiceView.swift
//  TeamDiceRoller
//
//  Created by Thane Heninger on 10/31/20.
//

import SwiftUI

struct DotView: View {
    let size: CGFloat
    var body: some View {
        Circle()
            .frame(width: size, height: size)
    }
}

struct DotStack: View {
    let arrangement: [Bool]
    let dotSpacing: CGFloat
    let dotSize: CGFloat
    
    var body: some View {
        VStack(spacing: dotSpacing) {
            if arrangement[0] {
                DotView(size: dotSize)
            } else {
                EmptyView()
            }
            ForEach(arrangement.dropFirst(), id: \.self) {
                Spacer()
                if $0 {
                    DotView(size: dotSize)
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
    
    func dotSize(from totalWidth: CGFloat) -> CGFloat {
        DotArrangement.init(quantity: quantity).in3x3 ?
            totalWidth * 0.26 : totalWidth * 0.16
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
        let spacing = -totalWidth * 0.20
//        print("stackSpacing(from: \(totalWidth)) -> \(spacing)")
        return spacing
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: stackSpacing(from: geo.size.width)) {
                if hasDots(dots: firstStack) {
                    DotStack(arrangement: firstStack,
                             dotSpacing: stackSpacing(from: geo.size.width),
                             dotSize: dotSize(from: geo.size.width))
                } else {
                    EmptyView()
                }
                ForEach(stacksExceptFirst, id: \.self) {
                    Spacer()
                    if hasDots(dots: $0) {
                        DotStack(arrangement: $0,
                                 dotSpacing: stackSpacing(from: geo.size.width),
                                 dotSize: dotSize(from: geo.size.width))
                    } else {
                        EmptyView()
                    }
                }
            }
        }
    }
}

struct DottedDiceView: View {
    let value: Int
    let size: CGFloat
    
    var body: some View {
        HStack {
            if value <= 6 {
                Image(systemName: "die.face.\(value)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
            } else {
                Text("\(value)").font(.largeTitle)
            }
            RoundedRectangle(cornerRadius: size * 0.15)
                .inset(by: size * 0.04)
                .stroke(lineWidth: size * 0.08)
                .overlay(ArrangedDots(quantity: value)
                            .padding(size * 0.16)
                )
                .frame(width: size, height: size)
        }
        .frame(width: size * 2 + 20, height: size)
    }
}

struct DottedDiceView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(1 ..< 26) {
                DottedDiceView(value: $0, size: 50)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
