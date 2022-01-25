//
//  ContentView.swift
//  RunTime
//
//  Created by Thomas O'Donnell (student LM) on 1/6/22.
//

import SwiftUI


struct ContentView: View {
    //   @StateObject var foodItem = Food()
    
    @StateObject var food : Food
    @State var name : String
    
    
    var body: some View{
        
        
        NavigationView{
            ZStack{
                Color.black
                VStack{
                    Text("Enter Food Below").bold().foregroundColor(.white)
                    VStack{
                        TextField("Search ...", text: $name).foregroundColor(Color.white).background(Color.gray)
                    }
                    
                    
                    
                    
                    NavigationLink(destination: DetailedView(name: $name, food: Food(name: Binding.constant("\(name)")))) {
                        Text("Search")
                    }
                }
                
            }.ignoresSafeArea()
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(food: Food(name: Binding.constant("pineapple")), name: " ")
        }
    }
}

