//
//  EditProductView.swift
//  La_Beate
//
//  Created by Israa Kheder on 18/06/1444 AH.
//

import SwiftUI

struct EditProductView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var product: FetchedResults<Product>.Element
    
    @State private var productName = ""
    @State private var productInfo = ""
    @State private var price = ""
    
    
    var body: some View {
        ZStack {
            Color("BG")
                .ignoresSafeArea(.all)
            
            VStack{
                HStack{
                    Spacer()
                    
                    Text("Dairy")
                        .foregroundColor(.black)
                        .font(.system(size: 27, weight: .bold))
                        .fontDesign(.serif)
                    
                    
                    Spacer()
                    
                }
                .padding(.top)
                
                Rectangle()
                    .fill(Color("BG").shadow(.drop(color:.black, radius: 10)))
                    .frame(width: 380, height: 401)
                    .cornerRadius(10)
                    .overlay(
                        Image("Myproduct")
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: 364, height: 386)
                    )
                
                
                HStack(spacing:150){
                    TextField("\(product.productName!)", text: $productName)
                        .onAppear{
                            productName = product.productName!
                        }
                        .frame(width: 150)
                        .lineLimit(1)
                        .font(.system(size: 20, weight: .semibold))
                        .fontDesign(.serif)
                    
                    TextField("\(product.price!)", text: $price)
                        .onAppear{
                            price = product.price!
                        }
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("Prize"))
                        .fontDesign(.serif)
                }
                .padding(.leading)
                .padding(.top, 24.0)
                
                TextField("\(product.productInfo!)", text: $productInfo)
                    .onAppear{
                        productInfo = product.productInfo!
                    }
                    .font(.system(size: 20, weight: .medium))
                    .fontDesign(.serif)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 24.0)
                    .padding(.leading)
                Spacer()
                
                HStack(spacing:40){
                    
                    Button(action:{
                        DataController().editProduct(product: product, productName: productName, productInfo: productInfo, price: price, context:  managedObjContext)
                        dismiss()}) {
                            Label("Done", systemImage: "heart.fill")
                                .font(.system(size: 15, weight: .semibold))
                                .fontDesign(.serif)
                                .padding(.trailing)
                                .foregroundColor(Color("BG"))
                                .frame(width: 156, height: 42)
                                .background(Color("BT"))
                                .cornerRadius(10.0)
                        }
                }
            }
        }
    }
}


