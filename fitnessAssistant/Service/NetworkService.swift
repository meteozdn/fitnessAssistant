//
//  NetworkService.swift
//  moviesApp
//
//  Created by Metehan Özden on 10.09.2024.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String{get}
    var path: String{get}
    var apiKey: String{get}
    
    var method: HttpMethods{get}
    
    func fitnessAppURL(_ withID: Int?)-> String
    func request(withBody body: [String: Any]?, withID: Int?)-> URLRequest
}

enum HttpMethods: String {
    case post = "POST"
    case get = "GET"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum Endpoint{
    case users
    case exercise
    case login
    case register
    case allCategories
    case mainCategories
}

extension Endpoint: EndpointProtocol{
    
    
  

    var baseURL: String {
        return "https://oguzhanatlan.online/"
    }
    
    var path: String {
        switch self {
        case .users:
            return "users/"
        case .exercise:
            return "exercises/"
        case .login:
            return "user_login/"
        case .register:
            return "user_register/"
        case .allCategories:
            return "categories/"
        case .mainCategories:
            return "categories_main/"
        }
    }
    
    var apiKey: String {
        return "api/key123/"
    }
   // &table=exercises&category=1
    var method: HttpMethods {
        switch self {
        case .users:
            return .get
        case .exercise:
            return .get
        case .login:
            return .post
        case .register:
            return .post
        case .mainCategories:
            return .get
        case .allCategories:
            return .get
        }
    }
    
    func fitnessAppURL(_ withID: Int? = nil) -> String {
        
        if let id = withID {
            print("\(baseURL)\(apiKey)\(path)\(id)/")
            return "\(baseURL)\(apiKey)\(path)\(id)/"
        }else{
            return "\(baseURL)\(apiKey)\(path)"
        }
    }
 
    func request(withBody body: [String: Any]? = nil, withID: Int? = nil) -> URLRequest {
        print(fitnessAppURL())
        var url = ""
        if let id = withID {
            url = fitnessAppURL(id)
        }else{
            url = fitnessAppURL()
        }
        guard let apiUrl = URLComponents(string: url)
        else {fatalError("URL COMPONENT OLUŞTURULAMADI") }
        
        guard let url = apiUrl.url else { fatalError("API URL OLUŞTURULMADI") }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let body = body, method == .post || method == .patch {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
                request.httpBody = jsonData
                
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                fatalError("Body JSON'a dönüştürülemedi")
            }
        }
        
        return request
    }

}

