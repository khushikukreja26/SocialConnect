import Foundation

enum NetworkError: Error {
    
    case badServerResponse
    case invalidURL
    case noData
    case decodingError
    
    var message: String {
        switch self {
        case .badServerResponse:
            return "Bad Server Response"
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "Passed Incorrect Data"
        case .decodingError:
            return "There has been an error in decoding"
        }
    }
}
 
