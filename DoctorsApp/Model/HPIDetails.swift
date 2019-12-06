//
//  HPIDetails.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import Foundation
struct HPIDetails : Codable {
	let statusCode : String?
	let statusMessage : String?
	let reply : Reply?

	enum CodingKeys: String, CodingKey {

		case statusCode = "statusCode"
		case statusMessage = "statusMessage"
		case reply = "reply"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		statusCode = try values.decodeIfPresent(String.self, forKey: .statusCode)
		statusMessage = try values.decodeIfPresent(String.self, forKey: .statusMessage)
		reply = try values.decodeIfPresent(Reply.self, forKey: .reply)
	}

}
