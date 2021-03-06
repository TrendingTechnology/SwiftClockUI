import SwiftUI

struct RotateOnAppear: ViewModifier {
    @Environment(\.clockIsAnimationEnabled) var isAnimationEnabled
    @State private var animate = false
    var clockwise = true

    func body(content: Content) -> some View {
        content
            .rotationEffect(rotationAngle)
            .onAppear {
                withAnimation(self.animation) {
                    self.animate = true
                }
            }
    }

    private var animation: Animation {
        Animation
            .linear(duration: 4)
            .repeatForever(autoreverses: false)
    }

    private var rotationAngle: Angle {
        guard isAnimationEnabled else { return .zero }
        if clockwise {
            return animate ? .fullRound : .zero
        } else {
            return animate ? -.fullRound : .zero
        }
    }
}
