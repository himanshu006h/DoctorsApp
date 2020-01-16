//
//  DoctorsAppParsingTest.swift
//  DoctorsAppTests
//
//  Created by Himanshu Saraswat on 08/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import XCTest
@testable import DoctorsApp

class DoctorsAppParsingTest: XCTestCase {
    
    struct Constant {
        static let hpiList = "dummy"
        static let json = "json"
        static let templateId = "465"
        static let templateName = "Back Pain"
    }
    //MARk:- properties
    let decoder = JSONDecoder()
    var hpiResponse: HPIDetails!
    
    override func setUp() {
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: Constant.hpiList, ofType: Constant.json)
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        hpiResponse = try! decoder.decode(HPIDetails.self, from: data!)    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testNumberOfSentence() {
        let expectedSentenceRows = 9
        XCTAssertEqual(hpiResponse.reply?.hpi?.first?.sentences?.count, expectedSentenceRows)
    }
    
    func testHPIId() {
        let expectedId = Constant.templateId
        guard let selctedTemplateContant = hpiResponse.reply?.hpi?.first?.templateId else {
            return
        }
        
        XCTAssertEqual(selctedTemplateContant, expectedId)
    }
    
    func testHPIName() {
        let expectedName = Constant.templateName
        guard let selctedTemplateName = hpiResponse.reply?.hpi?.first?.templateName else {
            return
        }
        
        XCTAssertEqual(selctedTemplateName, expectedName)
    }

}
