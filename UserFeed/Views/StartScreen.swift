import SwiftUI

struct StartScreen: View {
    
    @State private var startApp = false
    
    var body: some View {
        
        if startApp {
            UserView()
        } else {
            
            ZStack {
                
                LinearGradient(
                    colors: [.blue, .purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    Image(systemName: "person.3.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                    
                    Text("SocialConnect")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Button {
                        startApp = true
                    } label: {
                        
                        Text("Enter App")
                            .padding()
                            .frame(width: 200)
                            .background(.white)
                            .foregroundColor(.blue)
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}

#Preview {
    StartScreen()
}
