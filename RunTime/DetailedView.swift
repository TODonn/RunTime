
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
    @State var countCounter : Int = 0
    
    
    func counttee() -> Int{
        
        return count
    }

    func countUpdater()  {
        var counttt : Int = count
        print("banananan")
        if count < 21 {
            
            DispatchQueue.main.async{
                if (true){
            counttt += 1
            count = counttt
                    countCounter = 0
                }             }
            
        
        }
                print(counttt)
        print(count)
    }
    

    
    var body: some View {
        
       
        List(food.responses.hints.indices){ counts in
            
            NavigationLink( destination:    DetailedViewDetail(food: Food(name: Binding.constant(food.responses.hints[counts].food.label ?? "nil")), name: self.$name, count: self.$count),
                            //(food: Food(name: Binding.constant(food.responses.hints[counts].food.label ?? "nil")), name: Binding.constant((food.responses.hints[counts].food.label ?? "nil")), count: Binding.constant((counttee())))
                            
                            label: {
              
                                Text(verbatim: "\(food.responses.hints[counts].food.label) \(countUpdater()) \(count) \(counts)" .replacingOccurrences(of: "Optional(\"", with: "").replacingOccurrences(of: "\")", with: ""))
            })
            
        } .navigationBarTitle("JSON DATA")
    }
}


struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(name: .constant("Pineapple"), food: Food(name: Binding.constant("Pineapple")))
    }
}
