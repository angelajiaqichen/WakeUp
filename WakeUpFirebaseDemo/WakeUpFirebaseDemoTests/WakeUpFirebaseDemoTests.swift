//
//  WakeUpFirebaseDemoTests.swift
//  WakeUpFirebaseDemoTests
//
//  Created by Angela Chen on 12/8/22.
//

import XCTest
@testable import WakeUpFirebaseDemo
import EventKit

final class WakeUpFirebaseDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      //var vm = ViewModel()
      
    }
  
    override func setUp() {
          super.setUp()
          var vm = ViewModel()
          // Put setup code here. This method is called before the invocation of each test method in the class.
      }
    override func tearDown() {
          // Put teardown code here. This method is called after the invocation of each test method in the class.
          super.tearDown()
      }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
      //XCTAssert(vm.weatherTemp > -1.0)
    }
    
    func testWeather() {
      let vm = ViewModel()
      XCTAssertGreaterThan(vm.weatherTemp, -100.0, "temperature should be above 0")
      
   }
  

  func testEventFetch() async throws {
      let vm = ViewModel()
      var ev = await EventsView()
      await ev.prepareEventStore()
      XCTAssertEqual(vm.events.count, 0)
  }
  
  func testReminderFetch() async throws {
    let vm = ViewModel()
    var tv = await TasksView()
    await tv.prepareReminderStore()
    XCTAssertEqual(vm.reminders.count, 0)
  }
    

  func testReminderStore() {
    var rs = ReminderStore()
    XCTAssertNotNil(rs)
  }
  
  func testEventStore() {
    var es = ReminderStore()
    XCTAssertNotNil(es)
  }
  
  func testWeatherParser() {
    let vm = ViewModel()
    let wp = WeatherParser()
    XCTAssertGreaterThan(wp.urlString.count, 0, "url length should be greater than 0")
    wp.fetchWeather { (weather) in
      XCTAssertGreaterThan(vm.weatherType.count,0)
      XCTAssertGreaterThan(vm.weatherTemp,0)
        
    }
    
  }
  
  func testQuotes() {
      var viewModel = ViewModel()
      XCTAssertGreaterThan(viewModel.deck.drawRandomQuote().text.count, 0, "test the randomness")
      XCTAssertGreaterThan(viewModel.quote.text.count, 0, "quote length should be greater than 0")
    }
    func testAffirmations() {
      var viewModel = ViewModel()
      XCTAssertEqual(viewModel.affirmations.count,5, "total number of affirmations should be 5")
    }
    func testSuggestions() {
      var viewModel = ViewModel()
      XCTAssertGreaterThan(viewModel.sugDeck.drawRandomSuggestion().text.count, 0, "test the randomness")
      XCTAssertGreaterThan(viewModel.suggestion.text.count, 0, "quote length should be greater than 0")
    }
  
  
  
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
