/*
 SwiftUI File: Detailed View
 Written by: Andy Sun
 Date: 1/11/22 - 1/xx/22
 Description: The view when the dropdown is pressed. Contains the image, name of the food, and nutrients.
 
 


import SwiftUI

struct DetailedView: View {
    @StateObject var food = Food()
    var body: some View {
        
        HStack{
            List(food.responses.parsed){ a in
                Text(a.label ?? "Error")
                Text(String(a.nutrients[0].ENERC_KCAL))
                Text(String(a.nutrients[0].PROCNT))
                Text(String(a.nutrients[0].FAT))
                Text(String(a.nutrients[0].CHOCDF))
                Text(String(a.nutrients[0].FIBTG))
                //Text(food.whatever)
            }
        //Image(KFImage.whatever)
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView()
    }
}
*/
