//
//  DetailedViewDetail.swift
//  RunTime
//
//  Created by Elson Lin (student LM) on 1/24/22.
//

import SwiftUI

struct DetailedViewDetail: View {
    @ObservedObject var food : Food
    @Binding var name : String
    
    var body: some View {
        let text = food.responses.text
        let foodItem  = food.responses.hints.first?.food
        let foodLabel = food.responses.parsed.first?.food.label
        let nutrients = food.responses.parsed.first?.food.nutrients
        let imageUrl = food.responses.parsed.first?.food.image
        
        
    
            List(){
                
                Text(verbatim: "\(text) text - String?")
                Text(verbatim: "\(foodItem)  food Item ")
                Text(verbatim: "\(foodLabel)  food label")
                Text(verbatim: "\(nutrients)  food nutrients")
                //                Text(verbatim: "\(imageUrl)  food image URL --> King Fisher")
                
                
            } .navigationBarTitle(food.responses.hints.first?.food.label ?? "nil")
   
        }
    
}

struct DetailedViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        DetailedViewDetail(food: Food(name: Binding.constant("Pineapple")), name: Binding.constant("pineapple"))
    }
}
