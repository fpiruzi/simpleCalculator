//
//  CalcTest.swift
//  SimpleCalculatorTests
//
//  Created by Fabrizio Piruzi on 30/01/2019.
//  Copyright © 2019 fpiruzi. All rights reserved.
//

import XCTest
@testable import Pods_SimpleCalculator

class CalcTest: XCTestCase {
    
    var mathCalculator: MathCalculator!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mathCalculator = MathCalculator.sharedInstance
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mathCalculator = nil
    }

    func testSum(){
        XCTAssertEqual(mathCalculator.performCalc(expression: "1+1"), 2)
        XCTAssertEqual(mathCalculator.performCalc(expression: "54+2+1"), 57)
        XCTAssertEqual(mathCalculator.performCalc(expression: "10+2+1+5+2+3+1+9"), 33)
    }
    
    func testSub(){
        XCTAssertEqual(mathCalculator.performCalc(expression: "1-1"), 0)
        XCTAssertEqual(mathCalculator.performCalc(expression: "54-2-1"), 51)
        XCTAssertEqual(mathCalculator.performCalc(expression: "10-2-1-5-2-3-1-9"), -13)
    }
    
    func testMul(){
        XCTAssertEqual(mathCalculator.performCalc(expression: "1*1"), 1)
        XCTAssertEqual(mathCalculator.performCalc(expression: "54*2*1"), 108)
        XCTAssertEqual(mathCalculator.performCalc(expression: "10*2*1*5"), 100)
    }
    
    func testDiv(){
        XCTAssertEqual(mathCalculator.performCalc(expression: "1/1"), 1)
        XCTAssertEqual(mathCalculator.performCalc(expression: "54/2"), 27)
        XCTAssertEqual(mathCalculator.performCalc(expression: "10/2/5"), 1)
    }
    
    func testRandomOperations(){
        XCTAssertEqual(mathCalculator.performCalc(expression: "1/2+3*4.5"), 14)
        XCTAssertEqual(mathCalculator.performCalc(expression: "54/2-7*5-200"), -208)
    }
    
    func testInvalidExpression(){
        XCTAssertEqual(mathCalculator.performCalc(expression: "3+"), nil)
        XCTAssertEqual(mathCalculator.performCalc(expression: "4.5.4.3.2+"), nil)
        XCTAssertEqual(mathCalculator.performCalc(expression: "1/2+3*4.5.4.3.2+"), nil)
    }

}
