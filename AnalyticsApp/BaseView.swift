//
//  BaseView.swift
//  AnalyticsApp
//
//  Created by paige shin on 2022/10/26.
//

import SwiftUI

struct BaseView: View {
    
    @State var currentTab = "house"
    
    // Hiding Ntive One ...
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                Home()
                    .modifier(BGModifier())
                    .tag("house")
                Text("Graph")
                    .modifier(BGModifier())
                    .tag("chart.bar.fill")
                Text("Chat")
                    .modifier(BGModifier())
                    .tag("bubble.right.fill")
                Text("Settings")
                    .modifier(BGModifier())
                    .tag("rosette")
            }
            
            // Custom Tab Bar...
            HStack(spacing: 40) {
                
                // Tab Buttons...
                TabButton(image: "house")
                TabButton(image: "chart.bar.fill")
                
                // Center Add Button ...
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding(22)
                        .background(
                            Circle()
                                .fill(Color.blue)
                                .shadow(color: Color.blue.opacity(0.15), radius: 5, x: 0, y: 8)
                        )
                }
                // Moving Button Little Up
                .offset(y: -20)
                .padding(.horizontal, -15)
                
                TabButton(image: "bubble.right.fill")
                TabButton(image: "rosette")
                
            } //: HSTACK
            .padding(.top, -10)
            .frame(maxWidth: .infinity)
            .background(
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
            )
        }
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button {
            withAnimation {
                self.currentTab = image
            }
        } label: {
            Image(systemName: image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(
                    self.currentTab == image ? Color.black : Color.gray.opacity(0.8)
                )
        }
    }
    
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

// BG Modifier...
struct BGModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
            )
    }
    
}
