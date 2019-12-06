//
//  Findings.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import Foundation
struct Findings : Codable {
	let findingNote : String?
	let findingType : String?
	let findingName : String?
	let medcinId : String?
	let findingId : String?
	let freeText : String?
	let genericFindingName : String?
	let selectedOptions : [String]?
	let optionLists : [String]?
	let isSelected : Bool?
	let contradictionIds : [String]?
	let findingShortName : String?

	enum CodingKeys: String, CodingKey {

		case findingNote = "findingNote"
		case findingType = "findingType"
		case findingName = "findingName"
		case medcinId = "medcinId"
		case findingId = "findingId"
		case freeText = "freeText"
		case genericFindingName = "genericFindingName"
		case selectedOptions = "selectedOptions"
		case optionLists = "optionLists"
		case isSelected = "isSelected"
		case contradictionIds = "contradictionIds"
		case findingShortName = "findingShortName"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		findingNote = try values.decodeIfPresent(String.self, forKey: .findingNote)
		findingType = try values.decodeIfPresent(String.self, forKey: .findingType)
		findingName = try values.decodeIfPresent(String.self, forKey: .findingName)
		medcinId = try values.decodeIfPresent(String.self, forKey: .medcinId)
		findingId = try values.decodeIfPresent(String.self, forKey: .findingId)
		freeText = try values.decodeIfPresent(String.self, forKey: .freeText)
		genericFindingName = try values.decodeIfPresent(String.self, forKey: .genericFindingName)
		selectedOptions = try values.decodeIfPresent([String].self, forKey: .selectedOptions)
		optionLists = try values.decodeIfPresent([String].self, forKey: .optionLists)
		isSelected = try values.decodeIfPresent(Bool.self, forKey: .isSelected)
		contradictionIds = try values.decodeIfPresent([String].self, forKey: .contradictionIds)
		findingShortName = try values.decodeIfPresent(String.self, forKey: .findingShortName)
	}

}
