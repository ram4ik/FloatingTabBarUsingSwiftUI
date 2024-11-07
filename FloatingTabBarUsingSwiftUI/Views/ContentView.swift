//
//  ContentView.swift
//  FloatingTabBarUsingSwiftUI
//
//  Created by Ramill Ibragimov on 09.02.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                if self.selected == 0 {
                    home
                } else if self.selected == 1 {
                    wishlist
                } else if self.selected == 2 {
                    cart
                }
            }.background(Color("Color").edgesIgnoringSafeArea(.all))
            
            FloatingTabbar(selected: self.$selected)
        }
    }
    
    var home: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(1...8, id: \.self) { i in
                        Image("p\(i)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .cornerRadius(15)
                    }
                }.padding()
                .navigationBarTitle("Home", displayMode: .inline)
            }
        }
    }
    
    var wishlist: some View {
        GeometryReader { _ in
            Text("Wishlist")
        }
    }
    
    var cart: some View {
        GeometryReader { _ in
             Text("Cart")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

