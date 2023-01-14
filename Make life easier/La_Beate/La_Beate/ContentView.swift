//
//  ContentView.swift
//  La_Beate
//
//  Created by Israa Kheder on 16/06/1444 AH.
//

import SwiftUI

struct DairyView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var productName = ""
    @State private var productInfo = ""
    @State private var price = ""
    
    //    func buttonPressed(){
    //        print("Button Pressed")
    //    }
    //
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
                        .accessibilityLabel("Hey thats your dairy")
//                        .accessibility(label: Text("Diary"))
//                        .accessibility(value: Text("Dairy"))
//                    
                    
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
                            .accessibilityLabel("Random product image, will update soon")
                    )
                
                
                HStack(spacing:150){
                    TextField("Product Name", text: $productName)
                        
                        .frame(width: 150)
                        .lineLimit(1)
                        .foregroundColor(Color.black)
                        .font(.system(size: 20, weight: .semibold))
                        .fontDesign(.serif)
                        .accessibilityLabel("add your  product name")
                    
               
                    TextField("Price", text: $price)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color("Prize"))
                        .fontDesign(.serif)
                        .accessibilityLabel("add price of your product")
                }
                .padding(.leading)
                .padding(.top, 24.0)
                
                TextField("My opinion on this product",text: $productInfo)
                    .foregroundColor(Color.black)
                    .font(.system(size: 20, weight: .medium))
                    .fontDesign(.serif)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 24.0)
                    .padding(.leading)
                    .accessibilityLabel("here you can enter a brief description on the product ")
                Spacer()
                
                HStack(spacing:40){
                    Button(action:{
                        DataController().addProduct(productName: productName, productInfo: productInfo, price: price, context:  managedObjContext)
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
                        .accessibilityLabel("save your dairy, Perfect love")
                }
            }
        }
    }
}



struct DairyView_Previews: PreviewProvider {
    static var previews: some View {
        DairyView()
    }
}
