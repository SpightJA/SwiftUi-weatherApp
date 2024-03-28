////
////  APIService.swift
////  Swiftui-weather
////
////  Created by Jon Spight on 3/18/24.
////
//
//import Foundation
//
//class APIService {
//    static let shared = APIService()
//    enum APIError : Error {
//        case error(_ errorString : String)
//    }
//    func getJSON(urlString : String, completion: @escaping (Result<Forecast, APIError>) -> Void ) {
//        guard let url = URL(string: urlString) else {
//            completion(.failure(.error(NSLocalizedString("Error: Invalid URL", comment: ""))))
//            return
//        }
//        
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request){ data, response, error in
//            if let error = error {
//                completion(.failure(.error("Error:\(error.localizedDescription)")))
//            }
//            
//            guard let data = data else {
//                completion(.failure(.error(NSLocalizedString("Error: Invalid URL", comment: ""))))
//                return
//            }
//            
//            let decoder = JSONDecoder()
//            do {
//                let decodedData = try decoder.decode(Forecast.self, from: data)
//                completion(.success(decodedData))
//                return
//            } catch let decodingError {
//                completion(.failure(.error(NSLocalizedString("Error: Invalid URL", comment: ""))))
//                
//            }
//            
//        }
//    }
//}
