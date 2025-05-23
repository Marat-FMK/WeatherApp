//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Marat Fakhrizhanov on 18.05.2025.
//

import Foundation

enum NetworkError: String, Error {
    case badURL = "Error - bad URL"
    case sessionError = "Error - URLSession"
    case data = "Error - no data"
    case decode = "Error - JSON decoder error"
}

enum Endpoint: String {
    case forecast = "forecast.json"
    case search = "search.json"
}

class NetworkManager {
    
    private let apiKey = "2ecb82d8692b4197938190932251705"
    private let scheme = "https"
    private let host = "api.weatherapi.com"
    private let pathComponent = "/v1/"
    private let forecastEndpoint = "forecast.json"
    private let searchEndpoint = "search.json"
    private let dayQuery = URLQueryItem(name: "days", value: "5")
    
    func fetch<T: Decodable> (city: String, endpoint: Endpoint,
                              completion: @escaping(Result<T,NetworkError>) -> Void) {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = pathComponent + endpoint.rawValue
        
        var queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: city)
        ]
        if endpoint == .forecast {
            queryItems.append(dayQuery)
        }
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else { completion(.failure(.badURL)); return}
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil else {completion(.failure(.sessionError)); return}
            guard let data = data else { completion(.failure(.data)); return}
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decode))
            }
        }.resume()
    }
}
