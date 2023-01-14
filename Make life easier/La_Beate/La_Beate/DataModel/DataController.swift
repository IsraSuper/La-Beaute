//
//  DataController.swift
//  La_Beate
//
//  Created by Israa Kheder on 18/06/1444 AH.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ProductModel")
    
    init() {
        container.loadPersistentStores {desc, error in
            if let error = error {
                print("faild to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved!")
        } catch {
            print("Data id not saved")
        }
    }
    
    func addProduct(productName: String, productInfo: String, price: String, context: NSManagedObjectContext){
        let product = Product(context: context)
        product.id = UUID()
        product.productName = productName
        product.productInfo = productInfo
        product.price = price
        
        save(context: context)
    }
    
    func editProduct(product: Product, productName: String, productInfo: String, price: String, context: NSManagedObjectContext){
        product.productName = productName
        product.productInfo = productInfo
        product.price = price
        
        save(context: context)
        
    }
}
