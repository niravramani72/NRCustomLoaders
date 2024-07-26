//
//  PulsingLoader.swift
//  Learn
//
//  Created by Nirav Ramani on 26/07/24.
//

import SwiftUI

public struct PulsingLoader: View {
    public var color: Color = .red
    public var size: CGFloat = 50
    public var duration: Double = 1.0
    public var isLoading: Bool = true
    
    @State private var scale: CGFloat = 1.0
    @State private var animation: Animation? = nil

    public init(color: Color = .red, size: CGFloat = 50, duration: Double = 1.0, isLoading: Bool = true) {
        self.color = color
        self.size = size
        self.duration = duration
        self.isLoading = isLoading
    }

    public var body: some View {
        ZStack {
            if isLoading {
                Circle()
                    .fill(color)
                    .frame(width: size, height: size)
                    .scaleEffect(scale)
                    .opacity(scale == 1.2 ? 0.6 : 1.0)
                    .onAppear {
                        startAnimation()
                    }
            }
        }
        .onChange(of: isLoading) { newValue in
            if newValue {
                startAnimation()
            } else {
                stopAnimation()
            }
        }
    }

    private func startAnimation() {
        // Reset state for new animation
        scale = 1.0
        withAnimation(
            Animation.easeInOut(duration: duration)
                .repeatForever(autoreverses: true)
        ) {
            scale = 1.2
        }
    }

    private func stopAnimation() {
        // Reset scale to original state and stop animation
        scale = 1.0
    }
}
