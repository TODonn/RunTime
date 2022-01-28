
// SwiftUI File: Detailed View
// Written by: Andy Sun
//Date: 1/11/22 - 1/xx/22
//Description: The view when the dropdown is pressed. Contains the image, name of the food, and nutrients.




import SwiftUI
import struct Kingfisher.KFImage

struct DetailedView: View {
    
    
    @Binding var name : String
    @ObservedObject var food : Food
   @State var count : Int = 0
    
    var body: some View {
        
       
        List(food.responses.hints.indices){ counts in
            
            NavigationLink( destination:    DetailedViewDetail(food: Food(name: Binding.constant(food.responses.hints.first?.food.label ?? "nil")), name: Binding.constant((food.responses.hints[counts].food.label ?? "nil")), count: Binding.constant(counts)),
                            label: {
            Text(verbatim: "\((counts)+1). \(food.responses.hints[counts].food.label) " .replacingOccurrences(of: "Optional(\"", with: "").replacingOccurrences(of: "\")", with: ""))
                                
                                
            })
            
        } .navigationBarTitle("JSON DATA") .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(name: .constant("Pineapple"), food: Food(name: Binding.constant("Pineapple")))
    }
}
