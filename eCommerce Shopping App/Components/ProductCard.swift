import Foundation
import SwiftUI

struct ProductCard: View {

@EnvironmentObject var cart = CartManager()
var product: Product

var body: some View {

        ZStack(alignment: .topTrailing) {

            ZStack(alignment: .bottom) {

              // product images show up below
              Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()

                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                    
                    Text("\(product.price)$")
                        .font(.caption)
                  }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)

            Button {
                cart.addToCart(product: product)
            } label: {
                // cart button
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }
}

// preview
struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
