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
                .foregroundColor(.white)
                .blendMode(.difference)
                .overlay(.blendMode(.hue))
                .overlay(Color.white.blendMode(.overlay))
                .overlay(Color.black.blendMode(.overlay))
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .position(location)
                .gesture(
                    simpleDrag.simultaneously(with: fingerDrag)
                )
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
