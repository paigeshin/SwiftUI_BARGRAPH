//
//  BarGraph.swift
//  AnalyticsApp
//
//  Created by paige shin on 2022/10/26.
//

import SwiftUI

struct BarGraphData: Identifiable {
    var id: String = UUID().uuidString
    var height: CGFloat
    var weekDay: String
}

var data: [BarGraphData] = [
    BarGraphData(height: 500, weekDay: "Mon"),
    BarGraphData(height: 240, weekDay: "Tue"),
    BarGraphData(height: 350, weekDay: "Wed"),
    BarGraphData(height: 430, weekDay: "Thu"),
    BarGraphData(height: 690, weekDay: "Fri"),
    BarGraphData(height: 920, weekDay: "Sat"),
    BarGraphData(height: 750, weekDay: "Sun"),
]

struct BarGraph: View {
    
    var graphData: [BarGraphData]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                
                Text("Icons downloaded")
                    .fontWeight(.bold)
                
                Spacer()
                
                Menu {
                    
                    Button("Month") {}
                    Button("Year") {}
                    Button("Day") {}
                    
                } label: {
                    HStack(spacing: 4) {
                        Text("this week")
                        Image(systemName: "arrowtriangle.down.fill")
                            .scaleEffect(0.7)
                    } //: HSTACK
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.gray)
                } //: MENU

                
            } //: HSTACK
            
            HStack(spacing: 10) {
                Capsule()
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 20, height: 8)
                
                Text("Downloads")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.gray)
            } //: HSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Graph View
            GraphView()
                .padding(.top)
            
        } //: VSTACK
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.top, 25)
    } //: body
    
    @ViewBuilder
    func GraphView() -> some View {
        GeometryReader { proxy in
            // MARK: GRAPH
            ZStack {
                VStack(spacing: 0) {
                    ForEach(self.getGraphLines(), id: \.self) { line in
                        HStack(spacing: 8) {
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                        } //: HSTACK
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        // Removing the text size...
                        .offset(y: -15)
                        
                        
                    } //: FOREACH
                } //: VSTACK
                
                HStack {
                    ForEach(self.graphData) { data in
                        // MARK: INDIVIDUAL GRAPH
                        VStack(spacing: 0) {
                            VStack(spacing: 5) {
                                Capsule()
                                    .fill(Color.blue.opacity(0.3))
                                Capsule()
                                    .fill(Color.blue.opacity(0.8))
                            } //: VSTACK
                            .frame(width: 8)
                            .frame(height: self.getBarHeight(point: data.height, size: proxy.size))
                            
                            Text(data.weekDay)
                                .font(.caption2.bold())
                                .frame(height: 25, alignment: .bottom)
                        } //: VSTACK
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    } //: FOREACH
                } //: HSTACK
                .padding(.leading, 30)
            } //: ZSTACK
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        } //: GEO
        // Fixed Height
        .frame(height: 190)
    }
    
    func getBarHeight(point: CGFloat, size: CGSize) -> CGFloat {
        let max: CGFloat = self.getMax()
        
        // 25 Text Height
        // 5 Spacing...
        let height: CGFloat = (point / max) * (size.height - 37)
        return height
    }
    
    // getting Sample Graph Lines based on max Value...
    func getGraphLines() -> [CGFloat] {
        let max: CGFloat = self.getMax()
        var lines: [CGFloat] = []
        lines.append(max)
        for index in 1...4 {
            // dividing the max by 4 and iterating as index for graph lines...
            let progress: CGFloat = max / 4
            lines.append(max - (progress * CGFloat(index)))
        }
        return lines
    }
    
    // Getting Max...
    func getMax() -> CGFloat {
        let max = self.graphData.max { first, second in
            return second.height > first.height
        }?.height ?? 0
        return max
    }
    
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
