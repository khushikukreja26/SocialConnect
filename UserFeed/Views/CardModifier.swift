import SwiftUI

struct CardModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
            )
            .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 5)
            .padding(.horizontal)
    }
}

extension View {
    func cardStyle() -> some View {
        self.modifier(CardModifier())
    }
}
