//
//  LocationCell.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell, ConfigurationProtocol {
    
    // MARK:- Constants
    struct Constants {
        static let cellIdentifier = "LocationCollectionCell"
    }

    // MARK:- Properties
    @IBOutlet private weak var collectionView: UICollectionView!
    private var collectionDataSource: [Findings]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerLocationCell()
    }
    
    func configureCell(cellDependencyData: Any?) {
        guard let findings = cellDependencyData as? [Findings] else { return }
        self.collectionDataSource = findings
    }
    
    func registerLocationCell() {
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

extension LocationCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionDataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier, for: indexPath as IndexPath) as? LocationCollectionCell,
            let findings = self.collectionDataSource  else {
                return UICollectionViewCell()
        }
        
        cell.configureCell(cellDependencyData: findings[indexPath.row])
        return cell
    }
}

extension LocationCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //collectionView.frame.size.width
       guard let findings = self.collectionDataSource else {
            return .zero
        }
        let cellWidth = findings[indexPath.row].findingName?.width(withConstrainedHeight: 50, font: .systemFont(ofSize: 15, weight: .semibold)) ?? 0
        return CGSize(width: cellWidth, height: 50)
    }
}
