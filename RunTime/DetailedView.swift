
// SwiftUI File: Detailed View
// Written by: Andy Sun
//Date: 1/11/22 - 1/xx/22
//Description: The view when the dropdown is pressed. Contains the image, name of the food, and nutrients.
 
 


import SwiftUI
import struct Kingfisher.KFImage
struct DetailedView: View {
    @StateObject var food = Food()
    var body: some View {
        
        
        List(food.responses.parsed){ _ in
            HStack{
                KFImage(URL(string: "https://th-thumbnailer.cdn-si-edu.com/NaGo-Ynjy5Op3n9PYq7iySRQAO8=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/d6/93/d6939718-4e41-44a8-a8f3-d13648d2bcd0/c3npbx.jpg"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text(foodItem.label ?? "not found")
            }
        }
//        List(food.responses.parsed){ parsed in
//
//            HStack{
//                KFImage(URL(string: "https://th-thumbnailer.cdn-si-edu.com/NaGo-Ynjy5Op3n9PYq7iySRQAO8=/1000x750/filters:no_upscale()/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer/d6/93/d6939718-4e41-44a8-a8f3-d13648d2bcd0/c3npbx.jpg"))
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                Text(parsed.food ?? "not found")
//            }
//        }
        
//        HStack{
//            Text("heloo")
//            List(food.responses.parsed){ a in
//                Text(a.label ?? "Error")
//                Text(String(a.nutrients[0].ENERC_KCAL))
//                Text(String(a.nutrients[0].PROCNT))
//                Text(String(a.nutrients[0].FAT))
//                Text(String(a.nutrients[0].CHOCDF))
//                Text(String(a.nutrients[0].FIBTG))
//                //Text(food.whatever)
//            }
//        //Image(KFImage.whatever)
        
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView()
    }
}

