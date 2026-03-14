import SwiftUI

struct CommentsPage: View {
    
    let userDets: UsersDets
    @ObservedObject var viewModel: EscapingViewModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack(spacing: 20) {
                
                ForEach(viewModel.comments) { comment in
                    
                    HStack(alignment: .top, spacing: 12) {
                        
                        CircularImage(userId: comment.id)
                        
                        VStack(alignment: .leading) {
                            
                            Text(comment.email)
                                .font(.headline)
                            
                            Text(comment.body)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }
        }
        .navigationTitle("Comments")
        .task {
            viewModel.fetchComments(postId: userDets.id ?? 0)
        }
    }
}
