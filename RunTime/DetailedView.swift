
// SwiftUI File: Detailed View
// Written by: Andy Sun
//Date: 1/11/22 - 1/xx/22
//Description: The view when the dropdown is pressed. Contains the image, name of the food, and nutrients.
 
 


import SwiftUI
import struct Kingfisher.KFImage
struct DetailedView: View {
   
    @Binding var name : String
    @StateObject var food = Food(name: .constant("pineapple"))
  
    
    var body: some View {
        
   
        NavigationView{
            
       List(){
        Text(name + "(THIS IS NOT JSON - Elson)")
        Text(food.responses.text ?? "not found - this is JSON")
        
        
       }.navigationBarTitle("JSON DATA")

    }
        
        
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(name: .constant("default value"))
    }
}

