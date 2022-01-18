//
//  Food.swift
//  RunTime
//
//  Created by Andy Sun (student LM) on 1/11/22.
//

import Foundation


//    https://api.edamam.com/api/food-database/v2/parser?app_id=b272de9f&app_key=%2044bc2890f9f76046f5088aeae406682d&ingr=apple&nutrition-type=cooking

// "https://api.edamam.com/api/food-database/v2/parser?app_id=b272de9f&app_key=%2044bc2890f9f76046f5088aeae406682d&ingr=\("item name")&nutrition-type=cooking"

class Food : ObservableObject{
    @Published var responses = Response()
    func getData(){
        guard let url = URL(string: "https://api.edamam.com/api/food-database/v2/parser?app_id=b272de9f&app_key=%2044bc2890f9f76046f5088aeae406682d&ingr=apple&nutrition-type=cooking") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, erros) in
            guard let data = data else{
                print("error with data")
                return
            }
            guard let dataAsString = String(data: data, encoding: .utf8) else {return}
                 
            print(dataAsString)
            
            let decoder = JSONDecoder()
            if let response = try? decoder.decode(Response.self, from: data) {
                DispatchQueue.main.async {
                    self.responses = response
                }
            }
            
            
            else {
                print("error with decoder")
            }
            
            
            
        }.resume()
       
    }
    init(){
        getData()
    }
}

struct Response: Codable{
    var text : String? //text given to the API
    var parsed : [parsedItems] = [parsedItems]() //the actual food item, the name, image, and nutrients
    
}

struct parsedItems: Codable{
    var food: [foodItem] = [foodItem]()
}

struct foodItem: Codable{
    var label : String? //name of the food item
    var nutrients : [nutrient] = [nutrient]() //nutrients, more details in the struct
    var image : URL? //the image of the food i think
    
    
}
struct nutrient: Codable{
    var ENERC_KCAL : Double //Energy Calories of the food (in Kcal)
    var PROCNT : Double //Protein Content (in grams)
    var FAT : Double //Fat (in grams)
    var CHOCDF : Double //Carbohydrates (in grams)
    var FIBTG : Double //Fiber (in grams)
}

// add an extension to the article struct so that we can use an array of articles
// to dynamically create List.
extension foodItem: Identifiable{
    var id: String {return label!}
}


