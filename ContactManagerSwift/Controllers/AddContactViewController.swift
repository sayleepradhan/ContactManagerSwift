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
    
    var contact: ContactDBModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if contact != nil {
            loadData()
            deleteContactButton.isHidden = false
        }
        hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "deleteContact" {
            DataManager.sharedInstance.context().delete(contact!)
            DataManager.sharedInstance.saveContext()
        }
    }

    //MARK : Button actions
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        if (contact != nil) {
            saveData()
        } else {
            ContactDBModel.initWith(firstName: firstName,
                                    lastName: lastName,
                                    dateOfBirth: dateOfBirth,
                                    phone: phoneNumber,
                                    zipCode: zipCode)
        }
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
    
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    func loadData() {
        firstNameTextField.text = contact?.firstName
        firstName = (contact?.firstName) ?? ""
        lastNameTextField.text = contact?.lastName ?? ""
        lastName = (contact?.lastName) ?? ""
        dateOfBirthTextField.text = contact?.dateOfBirth ?? ""
        dateOfBirth = (contact?.dateOfBirth) ?? ""
        phoneNoTextField.text = contact?.phone ?? ""
        phoneNumber = (contact?.phone) ?? ""
        zipCodeTextField.text = contact?.zipCode ?? ""
        zipCode = (contact?.zipCode) ?? ""
    }
    
    func saveData() {
        contact?.firstName = firstName
        contact?.lastName = lastName
        contact?.dateOfBirth = dateOfBirth
        contact?.phone = phoneNumber
        contact?.zipCode = zipCode
        DataManager.sharedInstance.saveContext()
    }
}
