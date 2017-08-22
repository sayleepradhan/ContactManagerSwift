//
//  SearchContactViewController.swift
//  ContactManagerSwift
//
//  Created by Saylee Pradhan on 8/22/17.
//  Copyright © 2017 Saylee Pradhan. All rights reserved.
//

import UIKit

class SearchContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contactTableView: UITableView!
    
    var searchActive: Bool = false
    var contacts:[ContactDBModel] = [ContactDBModel]()
    var filteredContacts:[ContactDBModel] = [ContactDBModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let list = ContactDBModel.fetchAllContacts() {
            contacts = list
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK : SearchBar Delegate Methods

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredContacts = contacts.filter({ (contact) -> Bool in
            let tempContact: ContactDBModel = contact as ContactDBModel
            let range1 = tempContact.firstName?.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            let range2 = tempContact.lastName?.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return (range1 != nil) || (range2 != nil)
        })
        if(filteredContacts.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.contactTableView.reloadData()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filteredContacts.count
        }
        return contacts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactTableViewCell
        var contact: ContactDBModel
        if(searchActive){
            contact = filteredContacts[indexPath.row]
        } else {
            contact = contacts[indexPath.row]
        }
        cell.textLabel?.text = "\(contact.firstName!) \(contact.lastName!)"
        return cell;
    }
}

