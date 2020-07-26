//
//  CountryCodeTableViewController.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by Artem Pozdnyakov on 7/7/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit
import PinLayout

protocol UpdateCodePhoneDelegat: class {
    func updateCodeCountry(text: String)
}

class CountryCodeTableViewController: UITableViewController {
    
    private let country: Country = Country()
    private var filteredData: [String] = []
    private var searchView: UIView = UIView()
    
    let phoneView: PhoneViewImpl = PhoneViewImpl()
    weak var delegat: UpdateCodePhoneDelegat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.restorationIdentifier = "popVC"
        
        filteredData = country.contryCode
        setupSearchBar()
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupSearchBar() {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search Here....."
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.font = .sfCompactRounded20()
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true) {
            self.delegat?.updateCodeCountry(text: self.filteredData[indexPath.row])
        }
    }
}

class TableViewCell: UITableViewCell {
}


// MARK: - UISearchBarDelegate
extension CountryCodeTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        
        filteredData = searchText.isEmpty ? country.contryCode : country.contryCode.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        tableView.reloadData()
    }
}
