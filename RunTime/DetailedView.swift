
// SwiftUI File: Detailed View
// Written by: Elson Lin



import SwiftUI
import struct Kingfisher.KFImage

struct DetailedView: View {
    
    
    @Binding var name : String
    @ObservedObject var food : Food
    @State var count : Int = 0
    
    var body: some View {
        
        if (food.responses.hints.first?.food.label == nil){
            KFImage(URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRZ8QFc0iANE-OQiuVbsiwfbkL6JbE6Wqn6g&usqp=CAU:")).resizable().aspectRatio(contentMode: .fit)
            Text("Check your Spelling!")
        }
        //Displays error image if name is nil
        List(food.responses.hints.indices){ counts in
            // prints a list of all resultss
            NavigationLink( destination:    DetailedViewDetail(food: Food(name: Binding.constant(food.responses.hints.first?.food.label ?? "nil")), name: Binding.constant((food.responses.hints[counts].food.label ?? "nil")), count: Binding.constant(counts)),
                            label: {
                                Text(verbatim: "\((counts)+1). \(food.responses.hints[counts].food.label) "
                                        //numbers each listing and prints out each food item
                                        .replacingOccurrences(of: "Optional(\"", with: "").replacingOccurrences(of: "\")", with: ""))
                                
                                
                            })
            
        } .navigationBarTitle("\(name)") .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(name: .constant("Pineapple"), food: Food(name: Binding.constant("Pineapple")))
    }
}
