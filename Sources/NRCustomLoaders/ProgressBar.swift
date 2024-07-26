//
//  ProgressBar.swift
//  Learn
//
//  Created by Nirav Ramani on 26/07/24.
//

import SwiftUI

public struct LinearProgressBar: View {
    public var progress: Double // Completion percentage (0.0 to 1.0)
    public var color: Color = .orange
    public var lineWidth: CGFloat = 6
    public var animationDuration: Double = 1.0

    // Validate progress to ensure it's within the valid range (0.0 to 1.0)
    private var clampedProgress: Double {
        max(0.0, min(progress, 1.0))
    }

    @State private var animatedProgress: Double = 0.0

    public init(progress: Double, color: Color = .orange, lineWidth: CGFloat = 6, animationDuration: Double = 1.0) {
        self.progress = progress
        self.color = color
        self.lineWidth = lineWidth
        self.animationDuration = animationDuration
    }

    public var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background track
                    RoundedRectangle(cornerRadius: lineWidth / 2)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: lineWidth)
                    
                    // Progress bar
                    RoundedRectangle(cornerRadius: lineWidth / 2)
                        .fill(color)
                        .frame(width: geometry.size.width * CGFloat(animatedProgress), height: lineWidth)
                        .animation(
                            Animation.linear(duration: animationDuration)
                                .delay(0) // Ensure animation starts immediately
                        )
                }
                .onAppear {
                    withAnimation {
                        animatedProgress = clampedProgress
                    }
                }
                .onChange(of: clampedProgress) { newValue in
                    withAnimation(.linear(duration: animationDuration)) {
                        animatedProgress = newValue
                    }
                }
            }
        }
        .padding()
    }
}
