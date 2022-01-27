//
//  ContentView.swift
//  RunTime
//
//  Created by Thomas O'Donnell (student LM) on 1/6/22.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var food : Food
    @State var name : String

   
    
    var body: some View{
   
        NavigationView{
            ZStack{
                Color.blue
                VStack{
                    Text("NutriFacts")
                                            .foregroundColor(.white)
                                            .font(.system(size: 44))
                    Text("Enter Food Below").bold().foregroundColor(.black).font(.system(size: 24))
                    VStack{
                        TextField("Search ...", text: $name).foregroundColor(Color.black).background(Color(.systemGray4))
                
                    }
                    
                    NavigationLink(destination: DetailedView(name: Binding.constant("\(name)"), food: Food(name: Binding.constant("\(name)")))) {
                        Text("Search")
                    }
                }
                
            }.ignoresSafeArea()
        }.navigationViewStyle(StackNavigationViewStyle())
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(food: Food(name: Binding.constant("pineapple")), name: " ")
        }
    }
}

