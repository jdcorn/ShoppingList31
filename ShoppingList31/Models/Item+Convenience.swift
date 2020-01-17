//
//  Item+Convenience.swift
//  ShoppingList31
//
//  Created by Jon Corn on 1/17/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import Foundation
import CoreData

extension Item {
    convenience init(name: String, isPurchased: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.isPurchased = isPurchased
    }
}
