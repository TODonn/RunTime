//
//  DetailedViewDetail.swift
//  RunTime
//
//  Created by Elson Lin (student LM) on 1/24/22.
//

import SwiftUI
import struct Kingfisher.KFImage

struct DetailedViewDetail: View {
    @ObservedObject var food : Food
    @Binding var name : String
    @Binding var count : Int
    
    var body: some View {
        let foodLabel : String = "\(food.responses.hints[count].food.label)"
            .replacingOccurrences(of: "Optional(\"", with: "").replacingOccurrences(of: "\")", with: "")
        
        let imageUrl : String = "\(food.responses.hints[count].food.image)"
            .replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "")
        let Calories : String = "\(food.responses.hints[count].food.nutrients.ENERC_KCAL)".replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "")
        let Protein : String = "\(food.responses.hints[count].food.nutrients.PROCNT)".replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "")
        let Fat : String = "\(food.responses.hints[count].food.nutrients.FAT)".replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "")
        let Fiber : String = "\(food.responses.hints[count].food.nutrients.FIBTG)"
           .replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "")
        let Carbs : String = "\(food.responses.hints[count].food.nutrients.CHOCDF)"
           .replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "")
       
        Image("edamam").resizable() .aspectRatio(contentMode: .fit)
        
        List(){
           
            Text(verbatim: "\(foodLabel)")
            Text(verbatim: "Calories: \(Calories)")
            Text(verbatim: "Protein: \(Protein)g")
            Text(verbatim: "Fat: \(Fat)g")
            Text(verbatim: "Fiber: \(Fiber)g")
            Text(verbatim: "Carbohydrates: \(Carbs)g")
            
            if (imageUrl == "nil"){
            KFImage(URL(string: "https://zoomnearby.com/resources/media/images/common/Image-not-found.jpg"))
                .resizable().aspectRatio(contentMode: .fit)
            } else {
                KFImage(URL(string: imageUrl))
                    .resizable().aspectRatio(contentMode: .fit)
            }
            
        } .navigationBarTitle(food.responses.hints[count].food.label ?? "nil") .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct DetailedViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        DetailedViewDetail(food: Food(name: Binding.constant("Pineapple")), name: Binding.constant("pineapple"), count: Binding.constant(-1238))
    }
}
