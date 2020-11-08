//
//  DotArrangementWithBoxTests.swift
//  TeamDiceRollerTests
//
//  Created by Thane Heninger on 10/31/20.
//

import XCTest
@testable import TeamDiceRoller

class DotArrangementWithBoxTests: XCTestCase {

    let noDots = [false, false, false, false, false]
    let centerDot = [false, false, true, false, false]
    let outerDots = [true, false, false, false, true]
    let threeDots = [true, false, true, false, true]
    let allDots = [true, true, true, true, true]
    let mid2Dots = [false, true, false, true, false]
    let outerMidDots = [true, true, false, true, true]

    func testOne() throws {
        let arrangement = DotArrangementWithBox(quantity: 1)
        XCTAssertEqual(arrangement.farSideCount, 0)
        XCTAssertEqual(arrangement.centerCount, 1)
        XCTAssertEqual(arrangement.midSideCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, noDots)
        XCTAssertEqual(arrangement.midLeftDots, noDots)
        XCTAssertEqual(arrangement.centerDots, centerDot)
        XCTAssertEqual(arrangement.midRightDots, noDots)
        XCTAssertEqual(arrangement.farRightDots, noDots)
    }
    
    func testTwo() throws {
        let arrangement = DotArrangementWithBox(quantity: 2)
        XCTAssertEqual(arrangement.farSideCount, 1)
        XCTAssertEqual(arrangement.centerCount, 0)
        XCTAssertEqual(arrangement.midSideCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, [false, false, false, false, true])
        XCTAssertEqual(arrangement.midLeftDots, noDots)
        XCTAssertEqual(arrangement.centerDots, noDots)
        XCTAssertEqual(arrangement.midRightDots, noDots)
        XCTAssertEqual(arrangement.farRightDots, [true, false, false, false, false])
    }
    
    func testThree() throws {
        let arrangement = DotArrangementWithBox(quantity: 3)
        XCTAssertEqual(arrangement.farSideCount, 1)
        XCTAssertEqual(arrangement.centerCount, 1)
        XCTAssertEqual(arrangement.midSideCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, [false, false, false, false, true])
        XCTAssertEqual(arrangement.midLeftDots, noDots)
        XCTAssertEqual(arrangement.centerDots, centerDot)
        XCTAssertEqual(arrangement.midRightDots, noDots)
        XCTAssertEqual(arrangement.farRightDots, [true, false, false, false, false])
    }
    
    func testFour() throws {
        let arrangement = DotArrangementWithBox(quantity: 4)
        XCTAssertEqual(arrangement.farSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 0)
        XCTAssertEqual(arrangement.midSideCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, outerDots)
        XCTAssertEqual(arrangement.midLeftDots, noDots)
        XCTAssertEqual(arrangement.centerDots, noDots)
        XCTAssertEqual(arrangement.midRightDots, noDots)
        XCTAssertEqual(arrangement.farRightDots, outerDots)
    }
    
    func testFive() throws {
        let arrangement = DotArrangementWithBox(quantity: 5)
        XCTAssertEqual(arrangement.farSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 1)
        XCTAssertEqual(arrangement.midSideCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, outerDots)
        XCTAssertEqual(arrangement.midLeftDots, noDots)
        XCTAssertEqual(arrangement.centerDots, centerDot)
        XCTAssertEqual(arrangement.midRightDots, noDots)
        XCTAssertEqual(arrangement.farRightDots, outerDots)
    }
    
    func testSix() throws {
        let arrangement = DotArrangementWithBox(quantity: 6)
        XCTAssertEqual(arrangement.farSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 0)
        XCTAssertEqual(arrangement.midSideCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, threeDots)
        XCTAssertEqual(arrangement.midLeftDots, noDots)
        XCTAssertEqual(arrangement.centerDots, noDots)
        XCTAssertEqual(arrangement.midRightDots, noDots)
        XCTAssertEqual(arrangement.farRightDots, threeDots)
    }
    
    func testSeven() throws {
        let arrangement = DotArrangementWithBox(quantity: 7)
        XCTAssertEqual(arrangement.farSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 1)
        XCTAssertEqual(arrangement.midSideCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, threeDots)
        XCTAssertEqual(arrangement.midLeftDots, noDots)
        XCTAssertEqual(arrangement.centerDots, centerDot)
        XCTAssertEqual(arrangement.midRightDots, noDots)
        XCTAssertEqual(arrangement.farRightDots, threeDots)
    }
    
    func testEight() throws {
        let arrangement = DotArrangementWithBox(quantity: 8)
        XCTAssertEqual(arrangement.farSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 2)
        XCTAssertEqual(arrangement.midSideCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, threeDots)
        XCTAssertEqual(arrangement.midLeftDots, noDots)
        XCTAssertEqual(arrangement.centerDots, outerDots)
        XCTAssertEqual(arrangement.midRightDots, noDots)
        XCTAssertEqual(arrangement.farRightDots, threeDots)
    }
    
    func testNine() throws {
        let arrangement = DotArrangementWithBox(quantity: 9)
        XCTAssertEqual(arrangement.farSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 3)
        XCTAssertEqual(arrangement.midSideCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, threeDots)
        XCTAssertEqual(arrangement.midLeftDots, noDots)
        XCTAssertEqual(arrangement.centerDots, threeDots)
        XCTAssertEqual(arrangement.midRightDots, noDots)
        XCTAssertEqual(arrangement.farRightDots, threeDots)
    }
    
    func testTen() throws {
        let arrangement = DotArrangementWithBox(quantity: 10)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 0)
        XCTAssertEqual(arrangement.centerCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, noDots)
        XCTAssertEqual(arrangement.centerDots, noDots)
        XCTAssertEqual(arrangement.midRightDots, noDots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testEleven() throws {
        let arrangement = DotArrangementWithBox(quantity: 11)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 0)
        XCTAssertEqual(arrangement.centerCount, 1)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, noDots)
        XCTAssertEqual(arrangement.centerDots, centerDot)
        XCTAssertEqual(arrangement.midRightDots, noDots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testTwelve() throws {
        let arrangement = DotArrangementWithBox(quantity: 12)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 1)
        XCTAssertEqual(arrangement.centerCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, [false, false, false, true, false])
        XCTAssertEqual(arrangement.centerDots, noDots)
        XCTAssertEqual(arrangement.midRightDots, [false, true, false, false, false])
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testThirteen() throws {
        let arrangement = DotArrangementWithBox(quantity: 13)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 1)
        XCTAssertEqual(arrangement.centerCount, 1)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, [false, false, false, true, false])
        XCTAssertEqual(arrangement.centerDots, centerDot)
        XCTAssertEqual(arrangement.midRightDots, [false, true, false, false, false])
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testFourteen() throws {
        let arrangement = DotArrangementWithBox(quantity: 14)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 0)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, mid2Dots)
        XCTAssertEqual(arrangement.centerDots, noDots)
        XCTAssertEqual(arrangement.midRightDots, mid2Dots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testFifteen() throws {
        let arrangement = DotArrangementWithBox(quantity: 15)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 1)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, mid2Dots)
        XCTAssertEqual(arrangement.centerDots, centerDot)
        XCTAssertEqual(arrangement.midRightDots, mid2Dots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testSixteen() throws {
        let arrangement = DotArrangementWithBox(quantity: 16)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 2)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, outerDots)
        XCTAssertEqual(arrangement.centerDots, outerDots)
        XCTAssertEqual(arrangement.midRightDots, outerDots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
        
    func testSeventeen() throws {
        let arrangement = DotArrangementWithBox(quantity: 17)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 3)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, outerDots)
        XCTAssertEqual(arrangement.centerDots, threeDots)
        XCTAssertEqual(arrangement.midRightDots, outerDots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testEighteen() throws {
        let arrangement = DotArrangementWithBox(quantity: 18)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 2)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, [true, false, false, true, true])
        XCTAssertEqual(arrangement.centerDots, outerDots)
        XCTAssertEqual(arrangement.midRightDots, [true, true, false, false, true])
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testNineteen() throws {
        let arrangement = DotArrangementWithBox(quantity: 19)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 3)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, [true, false, false, true, true])
        XCTAssertEqual(arrangement.centerDots, threeDots)
        XCTAssertEqual(arrangement.midRightDots, [true, true, false, false, true])
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testTwenty() throws {
        let arrangement = DotArrangementWithBox(quantity: 20)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 4)
        XCTAssertEqual(arrangement.centerCount, 2)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, outerMidDots)
        XCTAssertEqual(arrangement.centerDots, outerDots)
        XCTAssertEqual(arrangement.midRightDots, outerMidDots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testTwentyOne() throws {
        let arrangement = DotArrangementWithBox(quantity: 21)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 4)
        XCTAssertEqual(arrangement.centerCount, 3)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, outerMidDots)
        XCTAssertEqual(arrangement.centerDots, threeDots)
        XCTAssertEqual(arrangement.midRightDots, outerMidDots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testTwentyTwo() throws {
        let arrangement = DotArrangementWithBox(quantity: 22)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 5)
        XCTAssertEqual(arrangement.centerCount, 2)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, allDots)
        XCTAssertEqual(arrangement.centerDots, outerDots)
        XCTAssertEqual(arrangement.midRightDots, allDots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testTwentyThree() throws {
        let arrangement = DotArrangementWithBox(quantity: 23)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 5)
        XCTAssertEqual(arrangement.centerCount, 3)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, allDots)
        XCTAssertEqual(arrangement.centerDots, threeDots)
        XCTAssertEqual(arrangement.midRightDots, allDots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testTwentyFour() throws {
        let arrangement = DotArrangementWithBox(quantity: 24)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 5)
        XCTAssertEqual(arrangement.centerCount, 4)
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, allDots)
        XCTAssertEqual(arrangement.centerDots, outerMidDots)
        XCTAssertEqual(arrangement.midRightDots, allDots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testTwentyFive() throws {
        let arrangement = DotArrangementWithBox(quantity: 25)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 5)
        XCTAssertEqual(arrangement.centerCount, 5)
        
        
        XCTAssertEqual(arrangement.farLeftDots, allDots)
        XCTAssertEqual(arrangement.midLeftDots, allDots)
        XCTAssertEqual(arrangement.centerDots, allDots)
        XCTAssertEqual(arrangement.midRightDots, allDots)
        XCTAssertEqual(arrangement.farRightDots, allDots)
    }
    
    func testAllFalse() throws {
        XCTAssertTrue(DotArrangementWithBox.allFalse([false, false, false, false, false]))
        XCTAssertFalse(DotArrangementWithBox.allFalse([true, false, false, false, false]))
        XCTAssertFalse(DotArrangementWithBox.allFalse([false, false, true, false, false]))
        XCTAssertFalse(DotArrangementWithBox.allFalse([false, false, false, false, true]))
        XCTAssertFalse(DotArrangementWithBox.allFalse([true, true, true, true, true]))
    }
}
