import SwiftUI

struct UserView: View {
    
    @StateObject var viewModel = EscapingViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                BackgroundView()
                
                ScrollView {
                    
                    VStack(spacing: 24) {
                        
                        Text("Users")
                            .font(.system(size: 34, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        ForEach(viewModel.users) { user in
                            
                            VStack(alignment: .leading, spacing: 16) {
                                
                                HStack(spacing: 16) {
                                    
                                    CircularImage(userId: user.id)
                                        .frame(width: 60, height: 60)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(user.name)
                                            .font(.headline)
                                        
                                        Text(user.email)
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
                                    
                                    Spacer()
                                }
                                
                                HStack(spacing: 12) {
                                    
                                    NavigationLink {
                                        AddressView(user: user, viewModel: viewModel)
                                    } label: {
                                        Label("Address", systemImage: "map")
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(12)
                                    }
                                    
                                    NavigationLink {
                                        PostView(viewModel: viewModel)
                                    } label: {
                                        Label("Posts", systemImage: "text.bubble")
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(.green)
                                            .foregroundColor(.white)
                                            .cornerRadius(12)
                                    }
                                }
                            }
                            .cardStyle()
                        }
                    }
                    .padding(.top)
                }
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                }
            }
        }
        .task {
            viewModel.fetchUsers()
        }
    }
}

#Preview {
    UserView()
}
