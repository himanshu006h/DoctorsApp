//
//  LocationCollectionCell.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import UIKit

class LocationCollectionCell: UICollectionViewCell, ConfigurationProtocol {

    @IBOutlet private weak var btnLocation: RedCustomButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(cellDependencyData: Any?) {
        guard let locationDetail = cellDependencyData as? Findings,
            let name = locationDetail.findingName else {
                return
        }
        
        btnLocation.setTitle(name, for: .normal)
    }

    @IBAction func ontapLocationFinding(_ sender: Any) {
        guard let locationButton = sender as? UIButton else { return }
        locationButton.isSelected = !locationButton.isSelected
        // somehow from XIB color selection not working
        if(locationButton.isSelected) {
            locationButton.backgroundColor = UIColor(red: 0, green: 172/255, blue: 182/255, alpha: 1)
        } else {
            locationButton.backgroundColor = .white
        }
    }
}
