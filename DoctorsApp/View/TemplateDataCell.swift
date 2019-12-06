//
//  TemplateDataCell.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import UIKit

class TemplateDataCell: UITableViewCell, ConfigurationProtocol {
    
    // MARK:- Constants
    struct Constants {
        static let kMainStoryBoard = "Main"
        static let cellIdentifier = "TemplateCollectionData"
    }
    
    // MARK:- Properties
   private var collectionDataSource: TemplateData?
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var btnRepotedBY: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerTempleteCell()

    }
    
    func registerTempleteCell() {
        self.collectionView.register(UINib(nibName: Constants.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: Constants.cellIdentifier)
    }
    
    func configureCell(cellDependencyData: Any?) {
        guard let basicData = cellDependencyData as? TemplateData else { return }
        self.collectionDataSource = basicData
        self.btnRepotedBY.setTitle(basicData.reportedBy, for: .normal)
    }
    
    @IBAction func onTapOnNormal(_ sender: Any) {
        guard let normalButton = sender as? UIButton else { return }
        normalButton.isSelected = !normalButton.isSelected
    }
    @IBAction func onTapClearAllSection(_ sender: Any) {
        guard let clearAllButton = sender as? UIButton else { return }
        clearAllButton.isSelected = !clearAllButton.isSelected
    }
}


extension TemplateDataCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1// In our case this is one
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath as IndexPath) as? TemplateCollectionData,
            let templateDetails = collectionDataSource else {
                return UICollectionViewCell()
        }
        
        cell.configureCell(cellDependencyData: templateDetails)
        return cell
    }
}
