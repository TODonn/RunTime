//
//  ContentView.swift
//  RunTime
//
//  Created by Thomas O'Donnell (student LM) on 1/6/22.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var food : Food
    @State var name : String = "" // Keeps track of name
    
    
    
    var body: some View{
        
        NavigationView{
            ZStack{
                Color.blue //sets backgroun color
                VStack{
                    Text("NutriFacts")
                        .foregroundColor(.white)
                        .font(.system(size: 44))
                    Text("Enter Food Below").bold().foregroundColor(.black).font(.system(size: 24))
                    VStack{
                        TextField("Search ...", text: $name).foregroundColor(Color.black).background(Color(.systemGray4))
                        //TextField that takes in user input for the name
                    }
                    
                    NavigationLink(destination: DetailedView(name: Binding.constant("\(name)"), food: Food(name: Binding.constant("\(name)")))) {
                        Text("Search") .foregroundColor(Color.white)
                        
                        //navigation link that takes user to detailed view once search is pushed
                    }
                }
                
            }.ignoresSafeArea()
        }.navigationViewStyle(StackNavigationViewStyle())
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(food: Food(name: Binding.constant("pineapple")))
        }
    }
}

