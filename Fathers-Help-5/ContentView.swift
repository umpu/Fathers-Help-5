//
//  ContentView.swift
//  Fathers-Help-5
//
//  Created by Andrei Gorbunov on 11.03.2024.
//

import SwiftUI

struct DragView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .blendMode(.difference)
            .overlay(.blendMode(.hue))
            .overlay(Color.white.blendMode(.overlay))
            .overlay(Color.black.blendMode(.overlay))
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.white)
    }
}

struct ContentView: View {
    @State private var offset = CGSize.zero
    private var colors = [Color.white, .pink, .yellow, .black]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(colors, id: \.self) { color in
                    Rectangle().foregroundStyle(color)
                }
            }
            
            DragView()
                .offset(x: offset.width, y: offset.height)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = value.translation
                        }
                        .onEnded { _ in
                            withAnimation {
                                offset = .zero
                            }
                        }
                )
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
