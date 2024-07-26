//
//  DotLoader.swift
//  Learn
//
//  Created by Nirav Ramani on 26/07/24.
//

import SwiftUI

public struct DotLoader: View {
    public var color: Color = .orange
    public var size: CGFloat = 10
    public var duration: Double = 0.6
    public var isLoading: Bool = true
    
    @State private var animationIndex = 0
    @State private var timer: Timer?
    private var animationTimerInterval: Double

    public init(color: Color = .orange, size: CGFloat = 10, duration: Double = 0.6, isLoading: Bool = true) {
        self.color = color
        self.size = size
        self.duration = duration
        self.isLoading = isLoading
        self.animationTimerInterval = duration / 3
    }

    public var body: some View {
        ZStack {
            if isLoading {
                HStack(spacing: 10) {
                    ForEach(0..<3) { index in
                        Circle()
                            .fill(color)
                            .frame(width: size, height: size)
                            .scaleEffect(animationIndex == index ? 1.5 : 1.0)
                            .animation(
                                Animation.easeInOut(duration: duration)
                                    .repeatForever(autoreverses: true)
                                    .delay(Double(index) * duration / 3)
                            )
                    }
                }
                .onAppear {
                    startTimer()
                }
                .onDisappear {
                    stopTimer()
                }
                .onChange(of: isLoading) { newValue in
                    if newValue {
                        startTimer()
                    } else {
                        stopTimer()
                    }
                }
            }
        }
    }

    private func startTimer() {
        // Invalidate any existing timer
        stopTimer()
        
        // Create and start a new timer
        timer = Timer.scheduledTimer(withTimeInterval: animationTimerInterval, repeats: true) { _ in
            withAnimation {
                animationIndex = (animationIndex + 1) % 3
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
