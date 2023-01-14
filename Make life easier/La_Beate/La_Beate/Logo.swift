//
//  Logo.swift
//  La_Beate
//
//  Created by Israa Kheder on 18/06/1444 AH.
//

import SwiftUI

struct Logo: View {
    
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
        
    var body: some View {
        if isActive{
            productList()
        } else {
            ZStack {
                Color("BG")
                    .ignoresSafeArea()
                
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(0.3, contentMode: .fit)
                    .scaleEffect(size)
                    .opacity(opacity)
                    .padding(.bottom,100)
                
                VStack{
                    Text("Happy Skin, Happy Day :)")
                        .foregroundColor((Color("BT")))
                        .padding(.top,700)
                }
                
                
            } .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                    withAnimation {
                        self.isActive = true
                    }
                }
                
            }
        }
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}

