import SwiftUI

struct PostView: View {
    
    @ObservedObject var viewModel: EscapingViewModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack(spacing: 20) {
                
                ForEach(viewModel.usersDets) { post in
                    
                    NavigationLink {
                        CommentsPage(userDets: post, viewModel: viewModel)
                    } label: {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            
                            if let user = viewModel.users.first(where: { $0.id == post.userId }) {
                                
                                HStack {
                                    
                                    CircularImage(userId: user.id)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(user.name)
                                            .font(.headline)
                                        
                                        Text(user.email)
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "ellipsis")
                                }
                            }
                            
                           
                            AsyncImage(
                                url: URL(string: "https://picsum.photos/400/300?random=\(post.id ?? 1)")
                            ) { image in
                                
                                image
                                    .resizable()
                                    .scaledToFill()
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 220)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            
                            if let title = post.title {
                                
                                Text(title.capitalized)
                                    .font(.headline)
                            }
                            
                           
                            if let body = post.body {
                                
                                Text(body)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(3)
                            }
                            
                            
                            HStack(spacing: 25) {
                                
                                Image(systemName: "heart")
                                Image(systemName: "bubble.right")
                                Image(systemName: "paperplane")
                                
                                Spacer()
                            }
                            .font(.title3)
                            
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(16)
                        .shadow(radius: 4)
                        .padding(.horizontal)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Feed")
        .task {
            viewModel.fetchUsersDets()
        }
    }
}
