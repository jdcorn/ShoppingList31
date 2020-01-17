//
//  ItemController.swift
//  ShoppingList31
//
//  Created by Jon Corn on 1/17/20.
//  Copyright © 2020 jdcorn. All rights reserved.
//

import Foundation
import CoreData

class ItemController {
    // MARK: - Properties
    static let shared = ItemController()
    
    // Source of Truth
    var fetchedResultsController: NSFetchedResultsController<Item>
    init() {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let resultsController: NSFetchedResultsController<Item> = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isPurchased", cacheName: nil)
        fetchedResultsController = resultsController
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error performing the fetch: \(error.localizedDescription)")
        }
    }
    
    // MARK: - CRUD Functions
    func create(withName name: String) {
        _ = Item(name: name)
        saveToPersistence()
    }
    
    func delete(withItem item: Item) {
        CoreDataStack.context.delete(item)
        saveToPersistence()
    }
    
    func toggled(withItem item: Item) {
        item.isPurchased.toggle()
        saveToPersistence()
    }
    
    func saveToPersistence() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let error {
            print("error saving \(error.localizedDescription)")
        }
    }
}
