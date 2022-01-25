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
                Text("NutriFacts")
                Color.white
                VStack{
                    Text("Enter Food Below").bold().foregroundColor(.black).font(.system(size: 24))
                    VStack{
                        TextField("Search ...", text: $name).foregroundColor(Color.black).background(Color(.systemGray4))
                
                    }
                    
                    NavigationLink(destination: DetailedView(name: $name, food: Food(name: Binding.constant("\(name)")), count: 0)) {
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

