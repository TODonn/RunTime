//
//  ContentView.swift
//  RunTime
//
//  Created by Thomas O'Donnell (student LM) on 1/6/22.
//

import SwiftUI


struct ContentView: View {
//   @StateObject var foodItem = Food()

    @State var name : String = ""
    @State var ready : Bool = false
    var body: some View{

        VStack (alignment: .leading){
            Group {
                Text("Enter what food you want nutritional information about").font(.largeTitle)

            }

            
            TextField("Enter Food Item", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(Color.blue).background(Color.gray)
             
                
            Text("Your Food Item: \(name) - to show that name variable works - can delete later")
            
           
            
            NavigationView{
                NavigationLink(destination: DetailedView(name: $name)) {
                   
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
