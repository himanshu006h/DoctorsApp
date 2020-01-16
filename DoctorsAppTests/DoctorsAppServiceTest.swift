//
//  DoctorsAppServiceTest.swift
//  DoctorsAppTests
//
//  Created by Himanshu Saraswat on 08/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import XCTest
@testable import DoctorsApp

class DoctorsAppServiceTest: XCTestCase {
    
    struct Constants {
        static let StatusCodeDict = "Status code : 200"
        static let completionHandlerMsg = "Call completes immediately by invoking completion handler"
        static let testURL = "https://gist.githubusercontent.com/omkarImagene/74626336e35b3ff27aea6a26543778bf/raw/56e5af11a8e15fa67c056dbbcc67f4695eb6fa5e/Assignment"
    }
    
    var sessionUnderTest : URLSession!
    
    override func setUp() {
        sessionUnderTest = URLSession(configuration : URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidCallToInfoAPIGetsStatusCode200(){
        let request = Constants.testURL.urlRequest()
        let promise = expectation(description: Constants.StatusCodeDict)
        
        // when
        sessionUnderTest.dataTask(with: request) { (data, response, error) in
            // then
            if let error = error{
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else{
                    XCTFail("Status code = \(statusCode)")
                }
            }
            }.resume()
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
