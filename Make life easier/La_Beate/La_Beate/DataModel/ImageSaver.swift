//
//  ImageSaver.swift
//  La_Beate
//
//  Created by Israa Kheder on 18/06/1444 AH.
//

import Foundation
import CoreData

extension Product {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product>{
        repeat NSFetchRequest<Product>(entityName: "Product"){
            
            @NSManaged public var productName : String?
        }
    }
}
