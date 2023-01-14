//
//  productList.swift
//  La_Beate
//
//  Created by Israa Kheder on 18/06/1444 AH.
//
import SwiftUI
import CoreData

struct productList: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors : [SortDescriptor(\.id, order: .reverse)]) var product: FetchedResults<Product>
    
    @State private var showingAddView = false
    
    init() {
                let navBarAppearance = UINavigationBar.appearance()
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
              }
            
    
           
    
    var body: some View {
        
        
            NavigationView{
                ZStack {
                    Color("BG")
                        .ignoresSafeArea(.all)
                VStack(alignment: .leading){
                    Text("My products list")
                        .padding(.leading)
                        .foregroundColor(Color("Prize"))
                        .accessibilityLabel("My Product List")
                    List{
                        ForEach(product){ product in
                            NavigationLink(destination: EditProductView(product: product)){
                                HStack{
                                    VStack(alignment: .leading, spacing: 6){
                                        Text(product.productName!)
                                            .bold()
                                            .font(.system(size: 20))
                                            .fontDesign(.serif)
                                            .accessibilityLabel(product.productName!)
                                        Text(product.productInfo!)
                                            .font(.system(size: 20))
                                            .fontDesign(.serif)
                                            .accessibilityLabel(product.productInfo!)
                                            
                                    }
                                    Spacer()
                                    Text(product.price!)
                                        .font(.system(size: 20))
                                        .fontDesign(.serif)
                                        .accessibilityLabel(product.price!)
                                }
                            }
                        }
                        .onDelete(perform: deleteProduct)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
                . navigationTitle("My Skin Care").foregroundColor(Color("BT"))
                .accessibilityLabel("My Skin Care")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            showingAddView.toggle()
                        } label: {
                            Label("add product", systemImage: "plus.square")
                                .font(.system(size: 25))
                                .foregroundColor(Color("BT"))
                                .fontDesign(.serif)
                        }
                        .accessibilityLabel("add product button click")
                    }
                }
                .sheet(isPresented: $showingAddView){
                    DairyView()
                }
            }
        }
    }
    private func deleteProduct(offsets: IndexSet){
        withAnimation{
            offsets.map { product[$0] }.forEach(managedObjContext.delete)
                
                DataController().save(context: managedObjContext)
            }
        }
        
    }







//
//
//        NavigationView{
//            ZStack {
//                Color("BG")
//                    .ignoresSafeArea(.all)
//                ScrollView(.vertical,  showsIndicators: false){
//
//                    VStack(alignment: .trailing){
//
//                        Button(action: {
//                            DairyView()
//                        }){
//                            Image(systemName: "plus.square")
//                                .foregroundColor(Color("BT"))
//                                .position(x:360 , y:-25)
//                        }
//                        //First HStack
//                        HStack {
//
//
//                            Spacer()
//                            VStack{
//
//
//                                Image("m1")
//                                    .resizable()
//                                    .frame(width: 157, height: 231)
//                                    .cornerRadius(10)
//
//
//
//                                Text("VIT C SERUM")
//                                    .font(.body)
//                                    .position(x: 66, y: 25)
//
//
//
//                            }
//                            .shadow(radius: 4)
//                            .frame(width: 173, height: 292)
//
//
//                            Image(systemName: "heart")
//                                .foregroundColor(Color("pink"))
//                                .position(x:-29, y:230)
//
//
//                            Spacer()
//                            VStack{
//
//                                Image("m2")
//                                    .resizable()
//                                    .frame(width: 157.0, height: 231.0)
//                                    .cornerRadius(10)
//
//
//                                Text("THE ORDINARY")
//                                    .font(.body)
//                                    .position(x: 66, y: 25)
//                                //.shadow(color: Color("black"), radius: 2, x: 0, y: 2))
//                            }
//                            //.border(Color ("black"))
//
//
//                            //Rectangle()
//
//
//
//                            .shadow(radius: 4)
//                            .frame(width: 173, height: 292)
//                            //.overlay()
//
//
//                            Image(systemName: "heart.fill")
//                                .foregroundColor(Color("pink"))
//                                .position(x:-29 , y:230)
//                        }
//                        //Second HStack
//
//                        HStack {
//                            Spacer()
//                            VStack{
//                                Image("m3")
//                                    .resizable()
//                                    .frame(width: 157, height: 231)
//                                    .cornerRadius(10)
//
//
//
//                                Text("ORGINALS GRP")
//                                    .font(.body)
//                                    .position(x: 66, y: 25)
//
//                            }
//                            .shadow(radius: 4)
//                            .frame(width: 173, height: 292)
//
//
//                            Image(systemName: "heart.fill")
//                                .foregroundColor(Color("pink"))
//                                .position(x:-30 , y:220)
//                            Spacer()
//                            VStack{
//
//                                Image("m4")
//                                    .resizable()
//                                    .frame(width: 157.0, height: 231.0)
//                                    .cornerRadius(10)
//
//
//                                Text("SUN SCREEN")
//                                    .font(.body)
//                                    .position(x: 66, y: 25)
//
//                            }
//                            .shadow(radius: 4)
//                            .frame(width: 173, height: 292)
//
//
//                            Image(systemName: "heart")
//                                .foregroundColor(Color("pink"))
//                                .position(x:-30 , y:220)
//                        }
//                        //Third HStack
//
//                        HStack {
//                            Spacer()
//                            VStack{
//                                Image("m5")
//                                    .resizable()
//                                    .frame(width: 157.0, height: 231.0)
//                                    .cornerRadius(10)
//
//                                Text("SUN SCREEN")
//                                    .font(.body)
//                                    .position(x: 66, y: 25)
//
//
//                            }
//                            .shadow(radius: 4)
//                            .frame(width: 173, height: 292)
//
//
//
//                            Image(systemName: "heart")
//                                .foregroundColor(Color("pink"))
//                                .position(x:-30 , y:192)
//
//
//                            Spacer()
//                            VStack{
//
//                                Image("m6")
//                                    .resizable()
//                                    .frame(width: 157.0, height: 231.0)
//                                    .cornerRadius(10)
//
//                                Text("SUN SCREEN")
//                                    .font(.body)
//                                    .position(x: 66, y: 25)
//
//                            }
//                            .shadow(radius: 4)
//                            .frame(width: 173, height: 292)
//
//
//                            Image(systemName: "heart.fill")
//                                .foregroundColor(Color("pink"))
//                                .position(x:-30 , y:192)
//
//                        }
//
//
//
//
//
//                        //                    }
//                        .padding(.top, 0)
//                    }
//                    .navigationTitle("My Skin Care")
//                    .navigationBarTitleDisplayMode(.inline)

//.toolbarBackground(Color("pink")",
//for: .navigationBar)

//                .background(Color("beige"))
struct productList_Previews: PreviewProvider {
    static var previews: some View {
        productList()
    }
}

