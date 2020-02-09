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
                } else if self.selected == 1 {
                    GeometryReader { _ in
                        Text("Wishlist")
                    }
                } else if self.selected == 2 {
                    GeometryReader { _ in
                         Text("Cart")
                    }
                }
            }.background(Color("Color").edgesIgnoringSafeArea(.all))
            
            FloatingTabbar(selected: self.$selected)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FloatingTabbar: View {
    @Binding var selected: Int
    @State private var expanded = false
    
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            HStack {
                if !self.expanded {
                    Button(action: {
                        self.expanded.toggle()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .padding()
                    }
                } else {
                    Button(action: {
                        self.selected = 0
                    }) {
                        Image(systemName: "house")
                            .foregroundColor(self.selected == 0 ? .black : .white)
                            .padding(.horizontal)
                    }
                    Spacer(minLength: 15)
                    Button(action: {
                        self.selected = 1
                    }) {
                        Image(systemName: "heart")
                            .foregroundColor(self.selected == 1 ? .black : .white)
                            .padding(.horizontal)
                    }
                    Spacer(minLength: 15)
                    Button(action: {
                        self.selected = 2
                    }) {
                        Image(systemName: "cart")
                            .foregroundColor(self.selected == 2 ? .black : .white)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical, self.expanded ? 20 : 8)
            .padding(.horizontal, self.expanded ? 35 : 8)
            .background(Color.gray)
            .clipShape(Capsule())
            .padding(22)
            .shadow(radius: 15)
            .onLongPressGesture {
                self.expanded.toggle()
            }
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        }
    }
}
