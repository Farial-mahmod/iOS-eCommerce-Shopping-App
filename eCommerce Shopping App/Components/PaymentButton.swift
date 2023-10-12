import SwiftUI
import PassKit

// PassKit is essential to process the payments

struct PaymentButton: View {
  // Void equals to an empty tuple i.e. ()
    var action: () -> Void
    
    var body: some View {
      // Representable is a UIViewRepresentable instance to initiate and manage a UIView object in our SwiftUI view here
        Representable(action: action)
            .frame(minWidth: 100, maxWidth: 400)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
    }
}

// extending the PaymentButton
extension PaymentButton {
    struct Representable: UIViewRepresentable {
        var action: () -> Void
        
        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }
        
        func makeUIView(context: Context) -> UIView {
            context.coordinator.button
        }
        
        func updateUIView(_ rootView: UIView, context: Context) {
            context.coordinator.action = action
        }
    }

  // NSObject is a core class of Objective-C whose instances can behave as Objective-C instances
    class Coordinator: NSObject {
        var action: () -> Void
        var button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
        
        init(action: @escaping () -> Void) {
            self.action = action
            super.init()

            button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
        }
        
        @objc
      // below is an Objective-C function marked by @objc
        func callback(_ sender: Any) {
            action()
        }
    }
}

// preview
struct PaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        PaymentButton(action: {})
    }
}
