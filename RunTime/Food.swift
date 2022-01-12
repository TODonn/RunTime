//
//  Food.swift
//  RunTime
//
//  Created by Andy Sun (student LM) on 1/11/22.
//

import Foundation


//    https://api.edamam.com/api/food-database/v2/parser?app_id=b272de9f&app_key=%2044bc2890f9f76046f5088aeae406682d&ingr=apple&nutrition-type=cooking


class Food : ObservableObject{
    @Published var responses = Response()
    func getData(){
        guard let url = URL(string: "https://api.edamam.com/api/food-database/v2/parser?app_id=b272de9f&app_key=%2044bc2890f9f76046f5088aeae406682d&ingr=apple&nutrition-type=cooking") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, erros) in
            guard let data = data else{
                print("error with data")
                return
            }
            
            
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
}

struct Response: Codable{
    var text : String?
    var parsed : [foodItem] = [foodItem]()
    
}

struct foodItem: Codable{
    var label : String?
    var nutrients : [nutrient] = [nutrient]()
    var image : URL?
    
    
}
struct nutrient: Codable{
    var ENERC_KCAL : Double
    var PROCNT : Double
    var FAT : Double
    var CHOCDF : Double
    var FIBTG : Double
}

// add an extension to the article struct so that we can use an array of articles
// to dynamically create List.
extension foodItem: Identifiable{
    var id: String {return label!}
}


