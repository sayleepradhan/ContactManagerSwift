//
//  ContactDBModel+CoreDataProperties.swift
//  ContactManagerSwift
//
//  Created by Saylee Pradhan on 8/22/17.
//  Copyright © 2017 Saylee Pradhan. All rights reserved.
//

import Foundation
import CoreData


extension ContactDBModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactDBModel> {
        return NSFetchRequest<ContactDBModel>(entityName: "ContactDBModel")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var dateOfBirth: String?
    @NSManaged public var phone: String?
    @NSManaged public var zipCode: String?

    static func fetchAllContacts() -> [ContactDBModel]? {
        var contacts: [ContactDBModel] = []
        let moc = DataManager.sharedInstance.context()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ContactDBModel")
        
        do {
            guard let contactList = try moc.fetch(fetchRequest) as? [ContactDBModel] else {
                return nil
            }
            contacts = contactList
        } catch {
            fatalError("Failed to fetch events: \(error)")
        }
        return contacts
    }
    static func initWith(firstName: String, lastName: String,
                         dateOfBirth: String?, phone: String,
                         zipCode: String?) {
        guard let contact: ContactDBModel = NSEntityDescription.insertNewObject(forEntityName: "ContactDBModel",into: DataManager.sharedInstance.context()) as? ContactDBModel else {
            return
        }
        contact.firstName = firstName
        contact.lastName = lastName
        contact.dateOfBirth = dateOfBirth
        contact.phone = phone
        contact.zipCode = zipCode
        DataManager.sharedInstance.saveContext()
    }
}
