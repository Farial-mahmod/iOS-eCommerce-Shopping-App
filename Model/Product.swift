import Foundation

struct Product: Codable, Identifiable, Hashable {
  var id: Int
  var title: String
  var price: Float
  var description: String
  var category: String
  var image: String
  var rating: Rating
}

extension Product {
  
var imageURL: URL {
  URL(String: image)
}

var formatedRating: String {
        var result = ""
        for _ in 0...Int(rating.rate){
            result.append("★")
        }
        while result.count<5{
            result += "☆"
        }
        return result
    }
  
}

extension Product {
    static var sampleProducts: [Product] {
        let response: [Product]? = try? Bundle.main.loadAndDecodeJSON(filename: "products")
        return response ?? [Product(id: 1, title: "no", price: 10.5, description: "no", category: "no", image: "no", rating: Rating(rate: 10.0))]
    }
}

struct Rating: Identifiable, Hashable {
  let rate: Float
  let count: Int = Int.random(in: 0...100)
}
