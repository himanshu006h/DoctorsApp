//
//  TemplateData.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import Foundation
struct TemplateData : Codable {
	let templateName : String?
	let templateNote : String?
	let templateId : String?
	let reportedBy : String?

	enum CodingKeys: String, CodingKey {

		case templateName = "templateName"
		case templateNote = "templateNote"
		case templateId = "templateId"
		case reportedBy = "reportedBy"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		templateName = try values.decodeIfPresent(String.self, forKey: .templateName)
		templateNote = try values.decodeIfPresent(String.self, forKey: .templateNote)
		templateId = try values.decodeIfPresent(String.self, forKey: .templateId)
		reportedBy = try values.decodeIfPresent(String.self, forKey: .reportedBy)
	}

}
