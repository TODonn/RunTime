
// SwiftUI File: Detailed View
// Written by: Andy Sun
//Date: 1/11/22 - 1/xx/22
//Description: The view when the dropdown is pressed. Contains the image, name of the food, and nutrients.




import SwiftUI
import struct Kingfisher.KFImage

struct DetailedView: View {
    
    
    @Binding var name : String
    
    
 
    func foodObject() -> Food{

        
        @StateObject var foods = Food(name: Binding.constant(name))
        
        print("\(foods) from function")
        print( "\(foods.responses.text) from function")
        print("\(foods.name) from function")
        print("\(foods.responses.parsed.first?.food) from function")
   
        
        return foods
    }

    
    
        @StateObject var foods = Food(name: Binding.constant("pineapple"))
    //    @StateObject var food = Food(name: Binding.constant(name))
    
    
    var body: some View {
        
    
        
        NavigationView{
            
         
                
            List(){
                   
            

                    Text((foodObject().responses.parsed.first?.food.label ?? "nil"))
                    Text(verbatim: "\(foodObject().responses.parsed)")
                Text(verbatim: "\(foodObject().responses.parsed.first?.food.label ?? "error")")
                Text(verbatim: "\(foodObject().name)")
                Text(verbatim: "\(foodObject().$name)")
                Text(verbatim: "\(foodObject().responses)")
                Text(verbatim: "\(foodObject().$responses)")
                Text(verbatim: "\(foodObject().getData())")
                Text(verbatim: "\(foodObject())")
                
                Text(verbatim: "\(foods.responses.parsed.first?.food)")
                
                
                
                
                

                    } .navigationBarTitle("JSON DATA")
        
                
        

    }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(name: .constant("Pineapple"))
    }
}
