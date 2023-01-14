//
//  La_BeateApp.swift
//  La_Beate
//
//  Created by Israa Kheder on 16/06/1444 AH.
//

import SwiftUI

@main
struct La_BeateApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            Logo()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
