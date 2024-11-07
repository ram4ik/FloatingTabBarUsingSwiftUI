//
//  FloatingTabbar.swift
//  FloatingTabBarUsingSwiftUI
//
//  Created by admin on 11/7/24.
//  Copyright © 2024 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

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
