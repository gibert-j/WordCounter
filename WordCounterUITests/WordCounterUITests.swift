//
//  WordCounterUITests.swift
//  WordCounterUITests
//
//  Created by GibertJ on 6/08/22.
//

import XCTest

class WordCounterUITests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }



    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    // UI tests must launch the application that they test
    func testInitialStateIsCorrect() {
        // XCUIApplication() grants access to the application's test harness, allowing to query its user interface and perform actions as if it was a user
        let app = XCUIApplication()
        app.launch()
        let table = XCUIApplication().tables
        XCTAssertEqual(table.cells.count, 56, "There should be 56 rows")
    }

    
    func testUserFilteringString() {
        // test buttons, filter with string "test". Assert that result is 56
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Word Counter"].buttons["Search"].tap()
        let filterAlert = app.alerts["Filter…"]
//        filterAlert.collectionViews.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("test")
        let textField = filterAlert.textFields.element
        textField.typeText("test")

        filterAlert.buttons["Filter"].tap()

        XCTAssertEqual(app.tables.cells.count, 56, "'Test' should provide 56 rows as result")
    }

    
//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
}
