import Foundation

class ModernManager {
    
    static let shared = ModernManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(from urlString: String) async throws -> T {
        
        guard let url = URL(string: urlString) else{
            throw URLError(.badURL)
        }
        
        let(data, _) = try await URLSession.shared.data(from: url)
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
}
