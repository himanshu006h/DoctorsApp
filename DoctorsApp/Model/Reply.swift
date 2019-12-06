//
//  Reply.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import Foundation
struct Reply : Codable {
	let sectionNote : String?
	let summaryText : String?
	let hpi : [Hpi]?
	let templates : [String]?
	let templateData : [TemplateData]?
	let sectionToken : String?
	let isHpiToRos : Bool?
	let sectionNoteLastModifiedDateTime : String?
	let lastModifiedDateTime : String?

	enum CodingKeys: String, CodingKey {

		case sectionNote = "sectionNote"
		case summaryText = "summaryText"
		case hpi = "hpi"
		case templates = "templates"
		case templateData = "templateData"
		case sectionToken = "sectionToken"
		case isHpiToRos = "isHpiToRos"
		case sectionNoteLastModifiedDateTime = "sectionNoteLastModifiedDateTime"
		case lastModifiedDateTime = "lastModifiedDateTime"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sectionNote = try values.decodeIfPresent(String.self, forKey: .sectionNote)
		summaryText = try values.decodeIfPresent(String.self, forKey: .summaryText)
		hpi = try values.decodeIfPresent([Hpi].self, forKey: .hpi)
		templates = try values.decodeIfPresent([String].self, forKey: .templates)
		templateData = try values.decodeIfPresent([TemplateData].self, forKey: .templateData)
		sectionToken = try values.decodeIfPresent(String.self, forKey: .sectionToken)
		isHpiToRos = try values.decodeIfPresent(Bool.self, forKey: .isHpiToRos)
		sectionNoteLastModifiedDateTime = try values.decodeIfPresent(String.self, forKey: .sectionNoteLastModifiedDateTime)
		lastModifiedDateTime = try values.decodeIfPresent(String.self, forKey: .lastModifiedDateTime)
	}

}
