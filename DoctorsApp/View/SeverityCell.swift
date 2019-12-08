//
//  SeverityCell.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import UIKit

class SeverityCell: UITableViewCell, ConfigurationProtocol {
    
    // MARK:- Constants
    struct Constants {
        static let cellIdentifier = "SeverityCollectionCell"
    }
    
    // MARK:- Properties
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var lblHeading: UILabel!
    private var collectionDataSource: [Findings]?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerQualityCell()
    }

    func configureCell(cellDependencyData: Any?, sectionName: String?) {
        guard let findings = cellDependencyData as? [Findings] else { return }
        self.collectionDataSource = findings
        self.lblHeading.text = sectionName
        DispatchQueue.main.async{
            self.collectionView.reloadData()
        }
    }
    
    func registerQualityCell() {
        self.collectionView.register(UINib(nibName: Constants.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: Constants.cellIdentifier)
    }
    
    @IBAction func onTapNormal(_ sender: Any) {
        guard let normalButton = sender as? UIButton else { return }
        normalButton.isSelected = !normalButton.isSelected
    }
    @IBAction func onTapClear(_ sender: Any) {
        guard let clearAButton = sender as? UIButton else { return }
        clearAButton.isSelected = !clearAButton.isSelected
        
    }
    
}

extension SeverityCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionDataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath as IndexPath) as? SeverityCollectionCell,
            let findings = self.collectionDataSource  else {
                return UICollectionViewCell()
        }
        
        cell.configureCell(cellDependencyData: findings[indexPath.row], sectionName: nil)
        return cell
    }
}

extension SeverityCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //collectionView.frame.size.width
        guard let findings = self.collectionDataSource else {
            return .zero
        }
        
        let cellWidth = findings[indexPath.row].findingName?.width(withConstrainedHeight: 50, font: .systemFont(ofSize: 15, weight: .bold)) ?? 0
        return CGSize(width: cellWidth + 30, height: 50)
    }
}

