import SwiftUI

struct CircularImage: View {
    
    let userId: Int
    
    var body: some View {
        
        AsyncImage(
            url: URL(string: "https://i.pravatar.cc/150?img=\(userId)")
        ) { image in
            
            image
                .resizable()
                .scaledToFill()
            
        } placeholder: {
            ProgressView()
        }
        .frame(width: 60, height: 60)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.white, lineWidth: 3)
        )
        .shadow(radius: 6)
    }
}
