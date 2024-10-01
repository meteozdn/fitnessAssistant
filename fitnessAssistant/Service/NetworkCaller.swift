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
    
    
    
}
