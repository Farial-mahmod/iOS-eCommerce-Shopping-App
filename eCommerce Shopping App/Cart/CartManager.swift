import Foundation

class CartManager: ObservableObject{

  @Published private(set) var products: [Product] = []
  @Published private(set) var total: Float = 0

  
  // to add products
  func addProduct(product: Product){
    products.append(product)
    total += product.price
  }

  // to remove products
  removeProduct(product: Product){
    // to remove a product from this array, the method .remove(at: ) could be an alternative
    products = products.filter { $0.id != product.id }
    total -= product.price
  }

  
  
}
