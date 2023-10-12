import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartManager
    
    var body: some View {
        ScrollView {
            if cart.paymentSuccess {
                Text("Thanks for your order.")
                    .padding()
            } else {
                if cart.products.count > 0 {
                    ForEach(cart.products, id: \.id) { product in
                        ProductRow(product: product)
                    }
                    
                    HStack {
                        Text("Your total is: ")
                        Spacer()
                        Text("$\(cart.total).00")
                            .bold()
                    }
                    .padding()
                    
                    PaymentButton(action: cart.pay)
                        .padding()
                    
                } else {
                    Text("Your cart is empty.")
                }
            }
        }
        .navigationTitle(Text("Cart"))
        .padding(.top)
        .onDisappear {
            if cart.paymentSuccess {
                cart.paymentSuccess = false
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
