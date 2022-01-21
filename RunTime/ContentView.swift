//
//  ContentView.swift
//  RunTime
//
//  Created by Thomas O'Donnell (student LM) on 1/6/22.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var foodItem = Food()
    @Binding var name : String
    var body: some View{
        
        VStack (alignment: .leading){
            Group {
                Text("Enter what food you want nutritional information about").font(.largeTitle)
                
            }
            //
            //            .textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(Color.blue).background(Color.gray)
            
            
            TextField("Enter Food Item", text: $name,
                      onEditingChanged: { (isBegin) in
                        if isBegin {
                            print("Begins editing")
                        } else {
                            print("Finishes editing")
                        }
                      },
                      onCommit: {
                        print("commit")
                      }
            )
            
            
            
            
            Text("Your Food Item: \($name.wrappedValue) - to show that name variable works - can delete later")
            
            
            
            NavigationView{
                NavigationLink(destination: DetailedView(name: $name)) {
                    
                    Text("Search")
                    
                }
            }
        }
    }
}

