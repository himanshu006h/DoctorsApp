//
//  QualityCollectionCell.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 08/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import UIKit

class QualityCollectionCell: UICollectionViewCell, ConfigurationProtocol {
    
    //MARK:- Properties
    @IBOutlet private weak var btnQuality: RedCustomButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(cellDependencyData: Any?, sectionName: String?) {
        guard let locationDetail = cellDependencyData as? Findings,
            let name = locationDetail.findingName else {
                return
        }
        
        btnQuality.setTitle(name, for: .normal)
    }
    
    @IBAction func ontapQualityFinding(_ sender: Any) {
        guard let locationButton = sender as? UIButton else { return }
        locationButton.isSelected = !locationButton.isSelected
        // somehow from XIB color selection not working
        if(locationButton.isSelected) {
            locationButton.backgroundColor = UIColor(red: 1, green: 33/255, blue: 95/255, alpha: 1)
        } else {
            locationButton.backgroundColor = .white
        }
    }

}
