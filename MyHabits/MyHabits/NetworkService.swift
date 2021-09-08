//
//  NetworkManager.swift
//  MyHabits
//
//  Created by Александр Глазков on 11.03.2021.
//

import Foundation

struct NetworkResponse {
    var httpResponseCode: Int?
    var httpResponseDescription: String?
    var httpHeadersDescription: String?
    var data: String?
}

struct NetworkError: Error {
    var errorDescription: String?
}

struct NetworkService {
        
    static func dataTask(config: AppConfiguration) {
        switch config {
        case .people(let urlString), .starchips(let urlString), .planets(let urlString):
            if let url = URL(string: urlString) {
                dataTask(url: url) { result in
                    print("---")
                    switch result {
                    case .success(let response):
                        print("request to \(urlString) is success ->")
                        if let code = response.httpResponseCode { print(" - code: \(code)") }
                        if let description = response.httpResponseDescription { print(" - description: \(description)") }
                        if let headers = response.httpHeadersDescription { print(" - headers: \(headers)") }
                        if let data = response.data { print(" - data: \(data)") }
                        break;
                    case .failure(let error):
                        print("request to \(urlString) is error ->")
                        if let errorDescription = error.errorDescription { print(" - description: \(errorDescription)") }
                        break;
                    }
                }
            }
            break
        }
    }
    
    private static func dataTask(url: URL, completed: @escaping (Result<NetworkResponse, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                return completed(.failure(NetworkError(errorDescription: error.localizedDescription)))
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                var result = NetworkResponse()
                result.httpResponseCode = httpResponse.statusCode
                result.httpResponseDescription = HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode)
                result.httpHeadersDescription = httpResponse.allHeaderFields.description
                if let data = data {
                    result.data = String(data: data, encoding: .utf8)
                }
                return completed(.success(result))
            }
            
            return completed(.failure(NetworkError(errorDescription: "Unknown error -> \(String(describing: response))")))
        }.resume()
    }
}
