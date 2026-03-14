import SwiftUI

struct AddressView: View {
    
    let user: User
    @ObservedObject var viewModel: EscapingViewModel
    
    var body: some View {
        
        ZStack {
            
            BackgroundView()
            
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    MapView(user: user)
                        .frame(height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding()
                    
                    CircularImage(userId: user.id)
                        .frame(width: 120, height: 120)
                        .offset(y: -70)
                        .padding(.bottom, -70)
                    
                    VStack(spacing: 8) {
                        
                        Text(user.name)
                            .font(.title.bold())
                        
                        Text(user.email)
                            .foregroundStyle(.secondary)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Label(user.address.street, systemImage: "house")
                        
                        Label(user.address.suite, systemImage: "building")
                        
                        Label("\(user.address.city), \(user.address.zipcode)",
                              systemImage: "location")
                    }
                    .cardStyle()
                }
            }
        }
    }
}
