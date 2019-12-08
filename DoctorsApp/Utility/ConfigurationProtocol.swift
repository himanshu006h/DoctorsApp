//
//  ConfigurationProtocol.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import Foundation

enum SectionDetails: Int {
    case basic = 0, location, quality, severity, duration

}

protocol ConfigurationProtocol: class {
    func configureCell(cellDependencyData: Any?, sectionName: String?)
}
