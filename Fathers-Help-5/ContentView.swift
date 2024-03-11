//
//  ContentView.swift
//  Fathers-Help-5
//
//  Created by Andrei Gorbunov on 11.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var location: CGPoint = CGPoint(x: 180, y: 400)
    @State private var fingerLocation: CGPoint?
    
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
            }
    }
    
    var fingerDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.fingerLocation = value.location
            }
            .onEnded { value in
                self.fingerLocation = nil
            }
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle().foregroundStyle(.white)
                Rectangle().foregroundStyle(.pink)
                Rectangle().foregroundStyle(.yellow)
                Rectangle().foregroundStyle(.black)
            }
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.black)
                .blendMode(.multiply)
                .frame(width: 100, height: 100)
                .position(location)
                .gesture(
                    simpleDrag.simultaneously(with: fingerDrag) // 4
                )
            if let fingerLocation = fingerLocation { // 5
                Circle()
                    .stroke(Color.green, lineWidth: 2)
                    .frame(width: 44, height: 44)
                    .position(fingerLocation)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
