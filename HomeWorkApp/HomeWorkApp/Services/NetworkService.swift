//
//  Network.swift
//  HomeWorkApp
//
//  Created by Admin on 09.09.2021.
//

import Foundation

struct NetworkResponse {
    var httpResponseCode: Int
    var httpResponseDescription: String
    var data: Data?
    
    init() {
        httpResponseCode = 0
        httpResponseDescription = ""
    }
    
    var isOK: Bool { return httpResponseCode >= 200 && httpResponseCode <= 226 }
    var isClientError: Bool { return httpResponseCode >= 400 && httpResponseCode <= 499 }
    var isServerError: Bool { return httpResponseCode >= 500 && httpResponseCode <= 526 }
    
    var isDataEmpty:Bool { return data != nil }
}

struct NetworkError: Error {
    var errorDescription: String
}

struct NetworkService {
        
    static func dataTask(url: String) {
        if let url = URL(string: url) {
            dataTask(url: url) { result in
                switch result {
                case .success(let response):
                    print("request to \(url) is success ->")
                    print(" - code: \(response.httpResponseCode)")
                    print(" - description: \(response.httpResponseDescription)")
                case .failure(let error):
                    print("request to \(url) is error ->")
                    print(" - description: \(error.errorDescription)")
                }
            }
        }
    }
    
    private static func dataTask(url: URL, completed: @escaping (Result<NetworkResponse, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return completed(.failure(NetworkError(errorDescription: error.localizedDescription)))
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                var result = NetworkResponse()
                result.httpResponseCode = httpResponse.statusCode
                result.httpResponseDescription = HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode)
                result.data = data
                
                return completed(.success(result))
            }
            
            return completed(.failure(NetworkError(errorDescription: "Unknown error -> \(String(describing: response))")))
        }.resume()
    }
}
