//
//  CircularLoader.swift
//  Learn
//
//  Created by Nirav Ramani on 26/07/24.
//

import SwiftUI

import SwiftUI

public struct CircularLoader: View {
    public var color: Color = .blue
    public var lineWidth: CGFloat = 4
    public var size: CGFloat = 50
    public var duration: Double = 1.0
    public var isLoading: Bool = true
    
    @State private var rotation: Double = 0
    
    public init(color: Color = .blue, lineWidth: CGFloat = 4, size: CGFloat = 50, duration: Double = 1.0, isLoading: Bool = true) {
        self.color = color
        self.lineWidth = lineWidth
        self.size = size
        self.duration = duration
        self.isLoading = isLoading
    }
    
    public var body: some View {
        if isLoading {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .foregroundColor(color)
                .rotationEffect(.degrees(rotation))
                .frame(width: size, height: size)
                .onAppear {
                    rotation = 0
                    withAnimation(
                        Animation.linear(duration: duration)
                            .repeatForever(autoreverses: false)
                    ) {
                        rotation = 360
                    }
                }
        }
    }
}
