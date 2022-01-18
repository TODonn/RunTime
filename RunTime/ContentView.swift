//
//  ContentView.swift
//  RunTime
//
//  Created by Thomas O'Donnell (student LM) on 1/6/22.
//

import SwiftUI


struct ContentView: View {
    @StateObject var foodItem = Food()
    var body: some View {
        List(foodItem.responses.parsed){a in
            Text(String(a.label ?? "Error"))
            
           
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
