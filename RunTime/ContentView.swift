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
        Text(/*foodItem.etc*/ "")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
