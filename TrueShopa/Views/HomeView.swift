//
//  HomeView.swift
//  TrueShopa
//
//  Created by Godwin IE on 30/06/2024.
//

import SwiftUI

struct HomeView: View {
        
    @ObservedObject var viewModel: CheckoutViewModel
    
    @State private var showToast = false
    @State private var toastMessage = ""
    @State private var toastScale = 0.0

    let columns = [GridItem(.adaptive(minimum: 140))]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 24) {
                    Image("logo")
                        .resizable()
                        .frame(width: 34, height: 34)
                        .scaledToFit()
                    
                    ScrollView(showsIndicators: false) {
                        LazyVGrid (columns: columns) {
                            ForEach(Items) { item in
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                    
                                    Image(item.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 130)
                                        .padding(.vertical, 20)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Text("$\(item.price, specifier: "%.2f")")
                                            .bold()
                                            .multilineTextAlignment(.leading)
                                            .foregroundStyle(.black)
                                        
                                        Spacer()
                                        
                                        AddButton(icon: "plus") {
                                            viewModel.addItem(item)
                                            showToast(message: "\(item.title) added to cart!")
                                            withAnimation(.easeInOut(duration: 0.4)) {
                                                toastScale = 1
                                            
                                            }

                                        }
                                    }
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(16)
                                .background(.gray.opacity(0.05))
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 24, height: 24)))
                            }
                        }
                    } // Vgrid
                }
                .padding(.horizontal)
                .padding(.top)
                
                if showToast {
                    VStack {
                        Toast(message: toastMessage)
                            .padding(.top, 74)
                            .scaleEffect(toastScale)
                        Spacer()
                    }
                }
            }
        }
    }
    
    private func showToast(message: String) {
        toastMessage = message
        showToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showToast = false
            toastScale = 0
        }
    }
}

#Preview {
    HomeView(viewModel: CheckoutViewModel())
}
