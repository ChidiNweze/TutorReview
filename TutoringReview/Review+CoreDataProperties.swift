//
//  Review+CoreDataProperties.swift
//  TutoringReview
//
//  Created by Chidinma Umenwofor-Nweze on 2020-05-10.
//  Copyright © 2020 Chidinma Umenwofor-Nweze. All rights reserved.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var student: String
    @NSManaged public var comment: String
    @NSManaged public var rating: String

}
