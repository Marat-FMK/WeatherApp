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
    private let forecastEndpoint = "forecast.json" // enum
    private let searchEndpoint = "search.json"
    private let dayCount = "5"
    
    init() { fetchWeather(city: "Moscow") { result in
//        switch result {
//            
//        }
    }}
    // write generic
    func fetchWeather(city: String, completion: @escaping (Result<Weather,NetworkError>) -> Void ) {
       var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = pathComponent + forecastEndpoint
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "days", value: dayCount)
        ]
        
        guard let url = urlComponents.url else {completion(.failure(.badURL)); return}
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {completion(.failure(.sessionError)); return}
            
            guard let data = data else {completion(.failure(.data)); return }
            
            do {
               let forecast = try JSONDecoder().decode(Weather.self, from: data)
                print("Forecast --->>>", forecast)
                completion(.success(forecast))
            } catch {
                completion(.failure(.decode))
            }
        }.resume()
    }
    
    func fetchCityes(searchText: String, completion: @escaping (Result<[Location], NetworkError>)-> Void) {
        var urlComponents = URLComponents()
         urlComponents.scheme = scheme
         urlComponents.host = host
         urlComponents.path = pathComponent + searchEndpoint
         urlComponents.queryItems = [
             URLQueryItem(name: "key", value: apiKey),
             URLQueryItem(name: "q", value: searchText)
         ]
         
         guard let url = urlComponents.url else { return }
         
         let request = URLRequest(url: url)
         
         URLSession.shared.dataTask(with: request) { data, response, error in
             
             guard error == nil else {completion(.failure(.sessionError)); return }
             
             guard let data = data else {completion(.failure(.data)); return }
             
             do {
                let cityes = try JSONDecoder().decode([Location].self, from: data)
                 print("Cityes --->>>",cityes)
                 completion(.success(cityes))
             } catch {
                 completion(.failure(.decode))
                 print("error")
             }
         }.resume()
    }
}
