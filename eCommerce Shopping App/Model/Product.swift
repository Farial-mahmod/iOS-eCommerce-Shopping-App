import Foundation

struct Product: Identifiable {

  var id = UUID()
  var name: String
  var image: String
  var price: Float
}

// sample products for the MVP version
var productList = [
  Product(name: "A Century Is Not Enough", image: "century", price: 7.50),
  Product(name: "Apple Watch", image: "watch", price: 300.00),
  Product(name: "Deep Thinking", image: "deep", price: 5.50),
  Product(name: "Mouse", image: "mouse", price: 6.50),
  Product(name: "Grand Design", image: "grand", price: 8.70),
  Product(name: "Sweater", image: "sweater", price: 15.50),
  Product(name: "Cream", image: "cream", price: 15.45),
  Product(name: "iPad", image: "ipad", price: 517.50),
]
