//
//  ViewController.swift
//  DoctorsApp
//
//  Created by Himanshu Saraswat on 06/12/19.
//  Copyright © 2019 Himanshu Saraswat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Constants
    struct Constants {
        static let cellIdentifier = "TemplateDataCell"
        static let locationCellIdentifier = "LocationCell"
        static let qualityCellCellIdentifier = "QualityCell"
        static let severityCellCellIdentifier = "SeverityCell"
        static let cancel = "Cancel"
        static let blank = ""
    }
    
    //MARK:- Properties
    @IBOutlet weak var hpiTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var hpiInformation: HPIDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        self.addrefreshControl()
        self.loadHPIDetails()
    }

    //refresh Table logic
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.black
        return refreshControl
    }()
    
    // drag table to refresh contact
    func addrefreshControl() {
        self.hpiTableView.addSubview(self.refreshControl)
    }
    
    private func loadHPIDetails(pullToRefresh: Bool = false) {
        if !pullToRefresh {
            startLoadingIndicator()
        }
        // get Data from service
        let hpiVModel = HPIViewModel(hpiInfo: nil, hpiDelegate: self)
        hpiVModel.fetchHPIDetails()
    }
    
    func startLoadingIndicator() {
        // start activity spinner
        view.bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        loadHPIDetails(pullToRefresh: true)
    }
    
    
    func updateTableView() {
        self.refreshControl.endRefreshing()
        self.activityIndicator.stopAnimating()
        self.hpiTableView.isHidden = false
        self.hpiTableView.reloadData()
    }
    
    func registerCells() {
        self.hpiTableView.register(UINib(nibName: Constants.cellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        self.hpiTableView.register(UINib(nibName: Constants.locationCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.locationCellIdentifier)
        
        self.hpiTableView.register(UINib(nibName: Constants.qualityCellCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.qualityCellCellIdentifier)
        
        self.hpiTableView.register(UINib(nibName: Constants.severityCellCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.severityCellCellIdentifier)

    }

}

extension ViewController: HPIInformation {
    func updateHPIDetails(hpiDetails: Any?, error: Error?) {
        
        if error == nil {
            guard let response = hpiDetails as? HPIDetails else {
                    return
            }
            
            self.hpiInformation = response
            DispatchQueue.main.async{
                self.updateTableView()
            }
        } else if let erorrDiscription = error {
            DispatchQueue.main.async {
                self.updateTableView()
                let alertViewController = UIAlertController(title: Constants.blank, message: erorrDiscription.localizedDescription, preferredStyle: .alert)
                alertViewController.addAction(UIAlertAction(title: Constants.cancel, style: UIAlertAction.Style.cancel, handler: nil))
                self.present(alertViewController, animated: true, completion: nil)
            }
        }
    }
}

//MARK: Table Datasource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var aReturnValue = 0
        guard let sections = self.hpiInformation?.reply?.hpi?.first?.sentences?.count else { return aReturnValue }
        aReturnValue = sections + 1 // one plus for basic cell
        return aReturnValue
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var aReturnValue = 0
        switch section {
        case SectionDetails.basic.rawValue:
            aReturnValue = 1
        case SectionDetails.location.rawValue:
            aReturnValue = 1
        default:
            aReturnValue = 1
        }
        
        return aReturnValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case SectionDetails.basic.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? TemplateDataCell,
                let details = self.hpiInformation?.reply?.templateData?.first else {
                    return UITableViewCell()
            }
            
            cell.configureCell(cellDependencyData: details, sectionName: nil)
            return cell
        case SectionDetails.location.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.locationCellIdentifier, for: indexPath) as? LocationCell,
                let details = self.hpiInformation?.reply?.hpi?.first?.sentences?.first?.findings else {
                    return UITableViewCell()
            }
            
            cell.configureCell(cellDependencyData: details, sectionName: nil)
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.severityCellCellIdentifier, for: indexPath) as? SeverityCell,
                let details = self.hpiInformation?.reply?.hpi?.first?.sentences?[indexPath.section - 1].findings,
                let heading = self.hpiInformation?.reply?.hpi?.first?.sentences?[indexPath.section - 1].sentenceName else {
                    return UITableViewCell()
            }
            
            cell.configureCell(cellDependencyData: details, sectionName: heading)
            return cell

        }

    }
}

