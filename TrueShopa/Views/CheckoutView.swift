//
//  CheckoutView.swift
//  TrueShopa
//
//  Created by Godwin IE on 30/06/2024.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var viewModel: CheckoutViewModel
    
    @State private var showCheckout = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if !viewModel.checkoutItems.isEmpty {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach($viewModel.checkoutItems) { $checkoutItem in
                                HStack(spacing: 18) {
                                    Image(checkoutItem.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .padding()
                                        .background(.gray.opacity(0.05))
                                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 18, height: 18)))
                                    
                                    
                                    VStack(alignment: .leading) {
                                        
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text(checkoutItem.title)
                                                
                                                Text("\(checkoutItem.quantity) pcs")
                                                    .foregroundStyle(.gray)
                                            }
                                            
                                            Spacer()
                                            
                                            Button(role: .destructive) {
                                                withAnimation(.easeInOut) {
                                                    viewModel.removeItem(checkoutItem)
                                                }
                                            } label: {
                                                Image(systemName: "trash")
                                            }
                                            .padding(10)
                                            .background(.red.opacity(0.1))
                                            .clipShape(Circle())
                                            
                                        }
                                        
                                        let itemPrice = checkoutItem.price * Double(checkoutItem.quantity)
                                        
                                        
                                        Stepper("$\(itemPrice, specifier: "%.2f")", value: $checkoutItem.quantity, in: 1...10)
                                    }
                                    
                                    
                                    
                                }
                            }
                        }
                        .padding()
                    }
                } else {
                    ContentUnavailableView("Your cart is empty", systemImage: "cart.fill", description: Text("Add items to check out"))
                }
                
                if !viewModel.checkoutItems.isEmpty {
                    VStack {
                        Spacer()
                        PrimaryButton(title: "Checkout") {
                            showCheckout = true
                            viewModel.checkoutItems.removeAll()
                        }
                        .padding(.bottom, 24)
                    }
                }
                
            } //zstack
            .navigationTitle("Checkout")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showCheckout) {
                CheckoutSuccessView()
            }
            
        }
    }
}

#Preview {
    CheckoutView(viewModel: CheckoutViewModel())
}
