import Foundation
import Combine


class EscapingViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var usersDets: [UsersDets] = []
    @Published var isLoading = false
    @Published var comments: [Comment] = []
    @Published var showError = false
    @Published var errorMsg = ""
    
    
    func fetchUsers() {
        isLoading = true
      
        EscapingNetwork.shared.fetchData(from: "users"){ (result: Result<[User], NetworkError>) in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                    
                case .failure(let error):
                    self.showError = true
                    self.errorMsg = error.message
                
                case .success(let users):
                    self.users = users
                }
            }
        }
    }
    
    
    
    func fetchUsersDets() {
        isLoading = true
      
        EscapingNetwork.shared.fetchData(from: "posts") { (result: Result<[UsersDets], NetworkError>) in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                    
                case .failure(let error):
                    self.showError = true
                    self.errorMsg = error.message
                    
                case .success(let usersDets):
                    self.usersDets = usersDets
                }
            }
        }
    }
       
    
    
    func fetchComments(postId: Int) {
        isLoading = true
        
        EscapingNetwork.shared.fetchData(from: "comments?postId=\(postId)"){ (result: Result<[Comment], NetworkError>) in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                    
                case .failure(let error):
                    self.showError = true
                    self.errorMsg = error.message
                    
                case .success(let comments):
                    self.comments = comments
                }
            }
        }
    }
}
