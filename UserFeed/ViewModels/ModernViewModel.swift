
import Foundation
import Combine


class ModernViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var usersDets: [UsersDets] = []
    @Published var isLoading = false
    @Published var comments: [Comment] = []
    
    
    func fetchUsers() async {
        isLoading = true
      
        do {
            let fetchUser: [User] =
            try await ModernManager.shared.fetchData(from: "https://jsonplaceholder.typicode.com/users")
            users = fetchUser
        } catch {
            print("Error fetching comments")
        }
        isLoading = false
    }
    
    func fetchUsersDets() async {
        isLoading = true
        do{
            let fetchedUsersDets: [UsersDets] =
            try await ModernManager.shared.fetchData(from: "https://jsonplaceholder.typicode.com/posts")
            usersDets = fetchedUsersDets
        } catch {
            print("Error Fetching the users")
        }
        
        isLoading = false
    }
        
    func fetchComments(postId: Int) async {
        isLoading = true
      
        do {
            let fetchComments: [Comment] =
            try await ModernManager.shared.fetchData(from: "https://jsonplaceholder.typicode.com/comments?postId=\(postId)")
            comments = fetchComments
        } catch {
            print("Error fetching comments")
        }
        isLoading = false
    }
    
    
}



//state, stateObject, observedObject, binding, envObject
//proper error handling
//use network class from a service
// completion , escaping closures - two new classes - viewmodel, networkCall


























