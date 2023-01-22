//
//  ContentView.swift
//  Drawing
//
//  Created by artembolotov on 17.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var thickness = 1.0
    struct Arrow: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: rect.midX, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxX))
            path.addLine(to: CGPoint(x: rect.maxX / 3 * 2, y: rect.maxX))
            path.addLine(to: CGPoint(x: rect.maxX / 3 * 2, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxX))
            path.addLine(to: CGPoint(x: 0, y: rect.maxX))
            path.addLine(to: CGPoint(x: rect.midX, y: 0))
            path.closeSubpath()
            
            return path
        }
    }
    
    var body: some View {
        Arrow()
            .stroke(.red, lineWidth: thickness)
            .frame(width: 130, height: 500)
            .contentShape(Arrow())
            .onTapGesture {
                withAnimation {
                    thickness = Double.random(in: 1.0...30.0)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
