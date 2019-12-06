//
//  TemplateCollectionData.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import UIKit

class TemplateCollectionData: UICollectionViewCell, ConfigurationProtocol {


    @IBOutlet private weak var btnBasic: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(cellDependencyData: Any?) {
        guard let templateDetail = cellDependencyData as? TemplateData,
        let name = templateDetail.templateName else {
            return
        }
        
        btnBasic.setTitle(name, for: .normal)
    }

}
