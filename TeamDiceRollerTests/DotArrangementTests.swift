//
//  DotArrangementTests.swift
//  TeamDiceRollerTests
//
//  Created by Thane Heninger on 10/31/20.
//

import XCTest
@testable import TeamDiceRoller

class DotArrangementTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testOne() throws {
        let arrangement = DotArrangement(quantity: 1)
        XCTAssertEqual(arrangement.farSideCount, 0)
        XCTAssertEqual(arrangement.centerCount, 1)
        XCTAssertEqual(arrangement.midSideCount, 0)
    }
    
    func testTwo() throws {
        let arrangement = DotArrangement(quantity: 2)
        XCTAssertEqual(arrangement.farSideCount, 1)
        XCTAssertEqual(arrangement.centerCount, 0)
        XCTAssertEqual(arrangement.midSideCount, 0)
    }
    
    func testThree() throws {
        let arrangement = DotArrangement(quantity: 3)
        XCTAssertEqual(arrangement.farSideCount, 1)
        XCTAssertEqual(arrangement.centerCount, 1)
        XCTAssertEqual(arrangement.midSideCount, 0)
    }
    
    func testFour() throws {
        let arrangement = DotArrangement(quantity: 4)
        XCTAssertEqual(arrangement.farSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 0)
        XCTAssertEqual(arrangement.midSideCount, 0)
    }
    
    func testFive() throws {
        let arrangement = DotArrangement(quantity: 5)
        XCTAssertEqual(arrangement.farSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 1)
        XCTAssertEqual(arrangement.midSideCount, 0)
    }
    
    func testSix() throws {
        let arrangement = DotArrangement(quantity: 6)
        XCTAssertEqual(arrangement.farSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 0)
        XCTAssertEqual(arrangement.midSideCount, 0)
    }
    
    func testSeven() throws {
        let arrangement = DotArrangement(quantity: 7)
        XCTAssertEqual(arrangement.farSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 1)
        XCTAssertEqual(arrangement.midSideCount, 0)
    }
    
    func testEight() throws {
        let arrangement = DotArrangement(quantity: 8)
        XCTAssertEqual(arrangement.farSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 2)
        XCTAssertEqual(arrangement.midSideCount, 0)
    }
    
    func testNine() throws {
        let arrangement = DotArrangement(quantity: 9)
        XCTAssertEqual(arrangement.farSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 3)
        XCTAssertEqual(arrangement.midSideCount, 0)
    }
    
    func testTen() throws {
        let arrangement = DotArrangement(quantity: 10)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 0)
        XCTAssertEqual(arrangement.centerCount, 0)
    }
    
    func testEleven() throws {
        let arrangement = DotArrangement(quantity: 11)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 0)
        XCTAssertEqual(arrangement.centerCount, 1)
    }
    
    func testTwelve() throws {
        let arrangement = DotArrangement(quantity: 12)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 1)
        XCTAssertEqual(arrangement.centerCount, 0)
    }
    
    func testThirteen() throws {
        let arrangement = DotArrangement(quantity: 13)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 1)
        XCTAssertEqual(arrangement.centerCount, 1)
    }
    
    func testFourteen() throws {
        let arrangement = DotArrangement(quantity: 14)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 0)
    }
    
    func testFifteen() throws {
        let arrangement = DotArrangement(quantity: 15)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 1)
    }
    
    func testSixteen() throws {
        let arrangement = DotArrangement(quantity: 16)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 2)
    }
    
    func testSeventeen() throws {
        let arrangement = DotArrangement(quantity: 17)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 2)
        XCTAssertEqual(arrangement.centerCount, 3)
    }
    
    func testEighteen() throws {
        let arrangement = DotArrangement(quantity: 18)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 2)
    }
    
    func testNineteen() throws {
        let arrangement = DotArrangement(quantity: 19)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 3)
        XCTAssertEqual(arrangement.centerCount, 3)
    }
    
    func testTwenty() throws {
        let arrangement = DotArrangement(quantity: 20)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 4)
        XCTAssertEqual(arrangement.centerCount, 2)
    }
    
    func testTwentyOne() throws {
        let arrangement = DotArrangement(quantity: 21)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 4)
        XCTAssertEqual(arrangement.centerCount, 3)
    }
    
    func testTwentyTwo() throws {
        let arrangement = DotArrangement(quantity: 22)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 5)
        XCTAssertEqual(arrangement.centerCount, 2)
    }
    
    func testTwentyThree() throws {
        let arrangement = DotArrangement(quantity: 23)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 5)
        XCTAssertEqual(arrangement.centerCount, 3)
    }
    
    func testTwentyFour() throws {
        let arrangement = DotArrangement(quantity: 24)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 5)
        XCTAssertEqual(arrangement.centerCount, 4)
    }
    
    func testTwentyFive() throws {
        let arrangement = DotArrangement(quantity: 25)
        XCTAssertEqual(arrangement.farSideCount, 5)
        XCTAssertEqual(arrangement.midSideCount, 5)
        XCTAssertEqual(arrangement.centerCount, 5)
    }
}
