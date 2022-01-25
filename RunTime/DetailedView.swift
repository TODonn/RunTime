
// SwiftUI File: Detailed View
// Written by: Andy Sun
//Date: 1/11/22 - 1/xx/22
//Description: The view when the dropdown is pressed. Contains the image, name of the food, and nutrients.




import SwiftUI
import struct Kingfisher.KFImage

struct DetailedView: View {
    
    
    @Binding var name : String
    @ObservedObject var food : Food

    var body: some View {
    
        
            List(food.responses.hints.indices){ index in
              
                NavigationLink( destination:    DetailedViewDetail(food: Food(name: Binding.constant(food.responses.hints[index].food.label ?? "nil")), name: Binding.constant((food.responses.hints.first?.food.label ?? "nil"))),
                                label: {
                                    Text(verbatim: "\(food.responses.hints[index].food.label)".replacingOccurrences(of: "Optional(\"", with: "").replacingOccurrences(of: "\")", with: ""))
                                 
                                   
                                })

                    } .navigationBarTitle("JSON DATA")
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(name: .constant("Pineapple"), food: Food(name: Binding.constant("Pineapple")))
    }
}
