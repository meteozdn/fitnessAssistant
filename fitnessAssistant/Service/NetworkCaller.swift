//
//  NetworkCaller.swift
//  moviesApp
//
//  Created by Metehan Özden on 10.09.2024.
//

import Foundation


protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(_ endpoint: Endpoint, complation: @escaping(Result<T,Error>)->Void)
}

final class NetworkCaller: NetworkServiceProtocol{
    
        func fetchData<T: Decodable>(_ endpoint: Endpoint, complation: @escaping(Result<T,Error>)->Void) {
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            
            if let error = error {
                complation(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else{
                print("hataaaa")
                return
            }
                      
            guard let data = data else {
                complation(.failure(URLError(.badURL)))
                return
            }
            
            do {
                print(data)
                let decoderData = try JSONDecoder().decode(T.self, from: data)
                print(decoderData)
                complation(.success(decoderData))
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    
    
    
    
}
