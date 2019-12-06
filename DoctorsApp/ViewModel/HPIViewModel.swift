//
//  HPIViewModel.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import Foundation

protocol HPIInformation: class {
    func updateHPIDetails(hpiDetails: Any?, error: Error?)
}

struct HPIViewModel {
    //MARK:- Properties
    var hpiInfo : HPIDetails?
    weak var hpiDelegate: HPIInformation?
    
    func fetchHPIDetails() {
        // Fetch data from the API
        NetworkDataLoader().loadResult { result in
            switch result {
            case let .success(hpiInfo):
                self.hpiDelegate?.updateHPIDetails(hpiDetails: hpiInfo, error: nil)
                // We had handle the error more precisely rather then just printing to console.
            // The specific type of error can generate specific error for the user
            case let .failure(error) :
                self.hpiDelegate?.updateHPIDetails(hpiDetails: nil, error: error)
            }
        }
    }
}
