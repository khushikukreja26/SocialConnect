
import Foundation

class EscapingNetwork {
    
    static let shared = EscapingNetwork()
    private init() {}
    let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func fetchData<T: Decodable>(from endString: String, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        let urlString = baseURL + endString
        
        guard let url = URL(string: urlString) else{
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let error = error {
                
                completion(.failure(NetworkError.badServerResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do{
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch{
                completion(.failure(NetworkError.decodingError))
            }
        }.resume()
    }
}
