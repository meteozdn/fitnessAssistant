//
//  NetworkService.swift
//  moviesApp
//
//  Created by Metehan Özden on 10.09.2024.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String{get}
    var tableURL: String{get}
    var apiKey: String{get}
    
    var method: HttpMethods{get}
    
    func fitnessAppURL()-> String
    func request()-> URLRequest
}

enum HttpMethods: String {
    case post = "POST"
    case get = "GET"
}

enum Endpoint{
    case users
    case exercises
}

extension Endpoint: EndpointProtocol{
    
  

    var baseURL: String {
        return "https://oguzhanatlan.online/api/api.php"
    }
    
    var tableURL: String {
        switch self {
        case .users:
            return "&table=users"
        case .exercises:
            return "&table=exercises"
        }
    }
    
    var apiKey: String {
        return "?api_key=key123"
    }
    
    var method: HttpMethods {
        switch self {
        case .users:
            return .get
        case .exercises:
            return .get

        }
    }
    
    func fitnessAppURL() -> String {
        return "\(baseURL)\(apiKey)\(tableURL)"
    }
    
    func request() -> URLRequest {
        
        guard let apiUrl = URLComponents(string: fitnessAppURL())
        else {fatalError("URL COMPONENT OLUŞTURULAMADI") }
        
        guard let url = apiUrl.url else { fatalError("API URL OLUŞTURULMADI") }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }

}

