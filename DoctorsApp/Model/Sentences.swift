//
//  Sentences.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import Foundation
struct Sentences : Codable {
	let sentenceNote : String?
	let sentenceName : String?
	let sentenceId : String?
	let findings : [Findings]?

	enum CodingKeys: String, CodingKey {

		case sentenceNote = "sentenceNote"
		case sentenceName = "sentenceName"
		case sentenceId = "sentenceId"
		case findings = "findings"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sentenceNote = try values.decodeIfPresent(String.self, forKey: .sentenceNote)
		sentenceName = try values.decodeIfPresent(String.self, forKey: .sentenceName)
		sentenceId = try values.decodeIfPresent(String.self, forKey: .sentenceId)
		findings = try values.decodeIfPresent([Findings].self, forKey: .findings)
	}

}
