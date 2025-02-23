//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by 阿福 on 23/02/2025.
//

import SwiftUI

struct CheckoutView: View {
    @Bindable var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var failedMessage = ""
    @State private var showingFailedAlert = false
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3.0) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 233)
            
            Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                .font(.title)
            
            Button("Place Order") {
                order.save()
                Task {
                    await placeOrder()
                }
            }
            .padding()
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
        
        .alert("Warning!", isPresented: $showingFailedAlert) {} message: {
            Text(failedMessage)
        }


    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            print("Checkout failed: \(error.localizedDescription)")
            failedMessage = error.localizedDescription
            showingFailedAlert = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
