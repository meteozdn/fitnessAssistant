//
//  NetworkCaller.swift
//  moviesApp
//
//  Created by Metehan Özden on 10.09.2024.
//

import Foundation


protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint,withBody body: [String: Any]?, withID: Int?, complation: @escaping(Result<T,Error>)->Void)
}

final class NetworkCaller: NetworkServiceProtocol{
    
        func request<T: Decodable>(_ endpoint: Endpoint, withBody body: [String: Any]? = nil, withID id: Int? = nil, complation: @escaping(Result<T,Error>)->Void) {
            let task = URLSession.shared.dataTask(with: endpoint.request(withBody: body, withID: id )) { data, response, error in
            if let error = error {
                complation(.failure(error))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else{
                complation(.failure(URLError(.badURL)))
                return
            }
                      
            guard let data = data else {
                complation(.failure(URLError(.badURL)))
                return
            }
               
            
            do {
                let decoderData = try JSONDecoder().decode(T.self, from: data)
                complation(.success(decoderData))
            } catch let error {
                print(error) 
            }
        }
        task.resume()
    }
    
    /*
    func request(withBody body: [String: Any]? = nil) -> URLRequest {
        guard let apiUrl = URLComponents(string: fitnessAppURL()) else {
            fatalError("URL COMPONENT OLUŞTURULAMADI")
        }

        guard let url = apiUrl.url else {
            fatalError("API URL OLUŞTURULMADI")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let body = body {
            do {
                // JSON formatına çeviriyoruz
                let jsonData = try JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
                request.httpBody = jsonData
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                print("JSON oluşturulamadı: \(error)")
            }
        }

        return request
    }
     */
    
    
  
    
    
    
    
}
