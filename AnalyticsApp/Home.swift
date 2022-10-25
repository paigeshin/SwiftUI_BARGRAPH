//
//  Home.swift
//  AnalyticsApp
//
//  Created by paige shin on 2022/10/26.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 18) {
                HStack {
                    
                    VStack(alignment: .leading, spacing: 8) {

                        Text("Weekly Icons")
                            .font(.title.bold())
                        
                        Text("reports is available!")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                    } //: VSTACK
                    
                    Spacer(minLength: 10)
                    
                    Button {
                        
                    } label: {
                        // Butotn with Badge...
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .overlay(
                                Text("2")
                                    .font(.caption2.bold())
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 11, y: -12),
                                alignment: .topTrailing
                            )
                            .offset(x: -2)
                            .padding(15)
                            .background(Color.white)
                            .clipShape(Circle())
                    }

                    
                } //: HSTACK
                
                // MARK: GRAPH VIEW...
                BarGraph(graphData: data)
                
            } //: VSTACK
            .padding()
        } //: SCROLL VIEW
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
