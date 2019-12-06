//
//  String+URLRequest.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import Foundation
import UIKit

// Mark:- Constants
struct Constants {
    static let methodName = "GET"
    static let kRequestType = "Content-Type"
    static let kContentType = "application/json"
}

extension String {
    func urlRequest(method: String = Constants.methodName) -> URLRequest {
        let url : URL = {
            let url = URL(string: self)!
            return url
        }()
        
        // Create request
        var request = URLRequest(url: url)
        request.addValue(Constants.kContentType, forHTTPHeaderField: Constants.kRequestType)
        // Setup HTTP method
        request.httpMethod = method
        return request
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
