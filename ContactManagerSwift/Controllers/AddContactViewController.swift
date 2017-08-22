//
//  AddContactViewController.swift
//  ContactManagerSwift
//
//  Created by Saylee Pradhan on 8/21/17.
//  Copyright © 2017 Saylee Pradhan. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var deleteContactButton: UIButton!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    var firstName = String()
    var lastName = String()
    var dateOfBirth = String()
    var phoneNumber = String()
    var zipCode = String()
    
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

    //MARK : Button actions
    @IBAction func deleteContactTapped(_ sender: UIButton) {
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        ContactDBModel.initWith(firstName: firstName,
                                lastName: lastName,
                                dateOfBirth: dateOfBirth,
                                phone: phoneNumber,
                                zipCode: zipCode)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK : Textfield delegate methods
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let input = textField.text  {
            switch textField.tag {
            case 1:
                    firstName = input
                break
            case 2:
                    lastName = input
                break
            case 3:
                    dateOfBirth = input
                break
            case 4:
                    phoneNumber = input
                break
            case 5:
                    zipCode = input
                break
            default: break
            }
        }
    }
}
