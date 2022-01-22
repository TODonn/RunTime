
// SwiftUI File: Detailed View
// Written by: Andy Sun
//Date: 1/11/22 - 1/xx/22
//Description: The view when the dropdown is pressed. Contains the image, name of the food, and nutrients.




import SwiftUI
import struct Kingfisher.KFImage

struct DetailedView: View {
    
    
    @Binding var name : String
    
    
    //    func nameBuffer() -> String {
    //
    //        @State var name2 : String = name
    //        return name2
    //    }
    //
    func foodObject() -> Food{
        
        @StateObject var foods = Food(name: Binding.constant(name) )
        
        return foods
    }
    
    
    
    //    @StateObject var food = Food(name: Binding.constant("pineapple"))
    //    @StateObject var food = Food(name: Binding.constant(name))
    var body: some View {
        
        
        
        NavigationView{
            
            VStack{
                List(){
                    Text(name + "(THIS IS NOT JSON - Elson)")
                    Text(foodObject().responses.parsed.first?.food.label ?? "error")
                    
                    
                }.navigationBarTitle("JSON DATA")
                
                
            }
        }
        
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(name: .constant("Pineapple"))
    }
}
