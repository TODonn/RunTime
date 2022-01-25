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
        let foodLabel : String = "\(food.responses.hints.first?.food.label)"
            .replacingOccurrences(of: "Optional(\"", with: "").replacingOccurrences(of: "\")", with: "")
        
        let imageUrl : String = "\(food.responses.parsed.first?.food.image)"
            .replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "")
        let Calories : String = "\(food.responses.parsed.first?.food.nutrients.ENERC_KCAL)".replacingOccurrences(of: "Optional(", with: "")
            .replacingOccurrences(of: ")", with: "")
        let Protein : String = "\(food.responses.parsed.first?.food.nutrients.PROCNT)".replacingOccurrences(of: "Optional(", with: "")
            .replacingOccurrences(of: ")", with: "")
        let Fat : String = "\(food.responses.parsed.first?.food.nutrients.FAT)".replacingOccurrences(of: "Optional(", with: "")
            .replacingOccurrences(of: ")", with: "")
        let Fiber : String = "\(food.responses.parsed.first?.food.nutrients.FIBTG)"
            .replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "")
        let Carbs : String = "\(food.responses.parsed.first?.food.nutrients.CHOCDF)"
            .replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "")
        
        
        List(){
            Text(verbatim: "\(foodLabel) - food label")
            Text(verbatim: "Calories: \(Calories)")
            Text(verbatim: "Protein: \(Protein)g")
            Text(verbatim: "Fat: \(Fat)g")
            Text(verbatim: "Fiber: \(Fiber)g")
            Text(verbatim: "Carbohydrates: \(Carbs)g \(count)")
            KFImage(URL(string: imageUrl))
                .resizable().aspectRatio(contentMode: .fit)
            Text(verbatim: "\(food.responses.hints)")
            
        } .navigationBarTitle(food.responses.hints.first?.food.label ?? "nil")
        
    }
    
}

struct DetailedViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        DetailedViewDetail(food: Food(name: Binding.constant("Pineapple")), name: Binding.constant("pineapple"), count: Binding.constant(0))
    }
}
