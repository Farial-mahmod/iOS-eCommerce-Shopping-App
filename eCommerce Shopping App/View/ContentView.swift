import SwiftUI

struct ContentView: View {
    @StateObject var cart = CartManager()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 20)], spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductCard(product: product)
                            .environmentObject(cart)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Shopping App"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cart)
                } label: {
                    CartButton(numberOfProducts: cart.products.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
