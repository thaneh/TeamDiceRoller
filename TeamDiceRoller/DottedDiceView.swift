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
    
    @ViewBuilder func dotOrEmpty(isDot: Bool) -> some View {
        if isDot {
            DotView(size: dotSize)
        } else {
            EmptyView()
        }
    }
    
    var body: some View {
        VStack(spacing: dotSpacing) {
            dotOrEmpty(isDot: arrangement[0])
            ForEach(arrangement.dropFirst(), id: \.self) {
                Spacer()
                dotOrEmpty(isDot: $0)
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
        DotArrangement(quantity: quantity).in3x3 ?
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
    
    @ViewBuilder func dotsOrEmpty(stack: [Bool], with width: CGFloat) -> some View {
        if hasDots(dots: stack) {
            DotStack(arrangement: stack,
                     dotSpacing: stackSpacing(from: width),
                     dotSize: dotSize(from: width))
        } else {
            EmptyView()
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: stackSpacing(from: geo.size.width)) {
                dotsOrEmpty(stack: firstStack, with: geo.size.width)
                ForEach(stacksExceptFirst, id: \.self) {
                    Spacer()
                    dotsOrEmpty(stack: $0, with: geo.size.width)
                }
            }
        }
    }
}

struct DottedDieView: View {
    let value: Int
    
    var stacks: [[Bool]] {
        let arrangement = DotArrangement(quantity: value)
        return [arrangement.farLeftDots,
                arrangement.midLeftDots,
                arrangement.centerDots,
                arrangement.midRightDots,
                arrangement.farRightDots]
    }
    
    func padding(with geo: GeometryProxy) -> CGFloat {
        if DotArrangement(quantity: value).in3x3 {
            return geo.size.width * 0.15
        } else {
            return geo.size.width * 0.18
        }
    }
    
    func spacing(with geo: GeometryProxy) -> CGFloat {
        geo.size.width * 0.13
    }
    
    func columnOffset(for column: Int, with geo: GeometryProxy) -> CGFloat {
        return padding(with: geo) + CGFloat(column) * spacing(with: geo)
    }
    
    func rowOffset(for row: Int, with geo: GeometryProxy) -> CGFloat {
        return padding(with: geo) + CGFloat(row) * spacing(with: geo)
    }
    
    func dotSize(with geo: GeometryProxy) -> CGFloat {
        let totalWidth = geo.size.width
        return DotArrangement(quantity: value).in3x3 ?
            totalWidth * 0.18 : totalWidth * 0.10
    }
    
    var body: some View {
        GeometryReader { geo in
            RoundedRectangle(cornerRadius: geo.size.width * 0.15)
                .inset(by: geo.size.width * 0.04)
                .stroke(lineWidth: geo.size.width * 0.08)
                
            ForEach(0 ..< 5) { columnIndex in
                ForEach(0 ..< stacks[columnIndex].count) { rowIndex in
                    if stacks[columnIndex][rowIndex] {
                        DotView(size: dotSize(with: geo))
                            .offset(x: columnOffset(for: columnIndex, with: geo),
                                    y: rowOffset(for: rowIndex, with: geo))
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
            DottedDieView(value: value)
                .frame(width: 100, height: 100)
//            RoundedRectangle(cornerRadius: size * 0.15)
//                .inset(by: size * 0.04)
//                .stroke(lineWidth: size * 0.08)
//                .overlay(ArrangedDots(quantity: value)
//                            .padding(size * 0.16)
//                )
//                .frame(width: size, height: size)
        }
        .frame(width: size * 2 + 20, height: size)
    }
}

struct DottedDiceView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(1 ..< 26) {
                DottedDiceView(value: $0, size: 100)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
