//
//  ContentView.swift
//  RunTime
//
//  Created by Thomas O'Donnell (student LM) on 1/6/22.
//

import SwiftUI


struct ContentView: View {
//   @StateObject var foodItem = Food()

    @State var name = ["enter food"]

    var body: some View{

        VStack {
            Group {
                Text("Enter what food you want nutritional information about").font(.largeTitle)

            }

            TextField("enter food ", text: $name[0])
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            NavigationView {
                     
                           NavigationLink(destination: DetailedView()) {
                               Text("Search")
                           }
                       }
                    }
                }
            }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
