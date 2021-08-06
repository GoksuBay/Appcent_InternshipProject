//
//  CoreDataService.swift
//  Appcent_InternshipProject
//
//  Created by Goksubay on 27.07.2021.
//

import Foundation
import CoreData
import UIKit

class CoreDataService {
    
    static let shared = CoreDataService()

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func addFavourites(wears: WearViewModel) -> Bool{
        
        if(checkExist(id: wears.id)){
            return false
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let favourites = NSEntityDescription.insertNewObject(forEntityName: "Favourites", into: context)
        
        
        
        favourites.setValue(wears.id, forKey: "id")
        favourites.setValue(wears.title, forKey: "title")
        favourites.setValue(wears.price, forKey: "price")
        favourites.setValue(wears.hasDiscound, forKey: "hasDiscound")
        favourites.setValue(wears.category, forKey: "category")
        favourites.setValue(wears.description, forKey: "desc")
        favourites.setValue(wears.oldPrice, forKey: "oldPrice")
        favourites.setValue(wears.images[0], forKey: "image")
        favourites.setValue(wears.rate, forKey: "rate")
        
        try? context.save()
        return true
    }
    
    func fetchFavourites() -> [NSManagedObject]{
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourites")
        fetchRequest.returnsObjectsAsFaults = false
        
        let results = try? context.fetch(fetchRequest)
        
        return results as! [NSManagedObject]
    }
    
    func deleteAllData(entity: String)
    {
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourites")
        fetchRequest.returnsObjectsAsFaults = false

        do
        {
            let results = try context.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                context.delete(managedObjectData)
            }
            try context.save()
        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
        }

    }
    
    func checkExist(id : Int) -> Bool{
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourites")
        fetchRequest.includesSubentities = false
        fetchRequest.predicate = NSPredicate(format: "id = %d", id)
        let results = (try? context.fetch(fetchRequest).count)!
        return results > 0
    }
    
    func delete(id: Int){
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourites")
        fetchRequest.includesSubentities = false
        fetchRequest.predicate = NSPredicate(format: "id = %d", id)
        let result = try? context.fetch(fetchRequest)
        let managedObject = result![0] as! NSManagedObject
        context.delete(managedObject)
        try! context.save()
    }
    
    func fetchFilteredData(with: String) -> [NSManagedObject]{
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favourites")
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "title CONTAINS[c] %@", with)
        let results = try? context.fetch(fetchRequest)
        return results as! [NSManagedObject]
    }
}
