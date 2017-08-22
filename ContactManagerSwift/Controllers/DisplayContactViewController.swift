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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactDetailCell", for: indexPath) as! ContactDetailTableViewCell
        return cell
    }

}
