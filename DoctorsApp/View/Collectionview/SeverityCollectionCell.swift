//
//  SeverityCollectionCell.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 08/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import UIKit

class SeverityCollectionCell: UICollectionViewCell, ConfigurationProtocol {

    @IBOutlet private weak var btnSeverity: RedCustomButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(cellDependencyData: Any?, sectionName: String?) {
        guard let locationDetail = cellDependencyData as? Findings,
            let name = locationDetail.findingName else {
                return
        }
        
        btnSeverity.setTitle(name, for: .normal)
    }
    
    @IBAction func ontapSeverityFinding(_ sender: Any) {
        guard let locationButton = sender as? UIButton else { return }
        locationButton.isSelected = !locationButton.isSelected
        if(locationButton.isSelected) {
            locationButton.backgroundColor = UIColor(red: 1, green: 33/255, blue: 95/255, alpha: 1)
        } else {
            locationButton.backgroundColor = .white
        }
    }

}
