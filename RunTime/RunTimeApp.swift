//
//  RunTimeApp.swift
//  RunTime
//
//  Created by Thomas O'Donnell (student LM) on 1/6/22.
//

import SwiftUI

@main

struct RunTimeApp: App {


    
    var body: some Scene {
      
        WindowGroup {
            ContentView(food: Food(name: Binding.constant("Pineapple")), name: " ")
        }
    }
}
