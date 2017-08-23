//
//  DisplayContactViewController.swift
//  ContactManagerSwift
//
//  Created by Saylee Pradhan on 8/22/17.
//  Copyright © 2017 Saylee Pradhan. All rights reserved.
//

import UIKit

class DisplayContactViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var contact: ContactDBModel?
    
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {

        DataManager.sharedInstance.context().refresh(contact!, mergeChanges: true)
        if let fname = contact?.firstName, let lname = contact?.lastName {
            contactNameLabel.text = "\(fname) \(lname)"
        }
        contactDetailTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editContact" {
            
            if let destinationVC = segue.destination as? AddContactViewController {
                destinationVC.contact = contact
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactDetailCell", for: indexPath) as! ContactDetailTableViewCell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Date of Birth"
            cell.valueLabel.text = contact?.dateOfBirth ?? "-"
            break;
        case 1:
            cell.fieldLabel.text = "Phone Number"
            cell.valueLabel.text = contact?.phone ?? "-"
        case 2:
            cell.fieldLabel.text = "Zip Code"
            cell.valueLabel.text = contact?.zipCode ?? "-"
        default:
            break
        }
        return cell
    }

}
