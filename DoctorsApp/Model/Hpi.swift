//
//  Hpi.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import Foundation
struct Hpi : Codable {
	let paragraphId : String?
	let paragraphName : String?
	let templateName : String?
	let templateId : String?
	let sentences : [Sentences]?

	enum CodingKeys: String, CodingKey {

		case paragraphId = "paragraphId"
		case paragraphName = "paragraphName"
		case templateName = "templateName"
		case templateId = "templateId"
		case sentences = "sentences"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		paragraphId = try values.decodeIfPresent(String.self, forKey: .paragraphId)
		paragraphName = try values.decodeIfPresent(String.self, forKey: .paragraphName)
		templateName = try values.decodeIfPresent(String.self, forKey: .templateName)
		templateId = try values.decodeIfPresent(String.self, forKey: .templateId)
		sentences = try values.decodeIfPresent([Sentences].self, forKey: .sentences)
	}

}
