//
//  APIError.swift
//  desafio-mobile
//
//  Created by Marco Marques on 23/02/19.
//  Copyright © 2019 Marco Marques. All rights reserved.
//

import Foundation

enum APIError: Int, Error {
    
    // erros da api
    case unauthorized
    case notFound
    case gatewayTimeout // erro antigo: timeOut
    
    // erros internos
    case invalidData // Error Parsing
    case notConnectedToInternet // Not Connect
    case requestTimeout // timeOut
    case unknown //unexpected
    
    
}

extension APIError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .unauthorized:
            return ""
        case .gatewayTimeout:
            return "Gateway timeout."
        case .invalidData:
            return "Erro ao buscar as informações."
        case .notConnectedToInternet:
            return "Aparentemente você está sem conexão."
        case .requestTimeout:
            return "Request timeout."
        default:
            return "Erro: Tente novamente."
        }
    }
    
    static func handleHttpStatus(response: HTTPURLResponse?) -> APIError? {
        
        guard let response = response else { return nil }
        
        switch response.statusCode {
        case 200...299:
            return nil
        case 401:
            return unauthorized
        case 404:
            return notFound
        case 504:
            return gatewayTimeout
        default:
            return unknown
        }
        
    }
    
    static func handleError(error: NSError?) -> APIError? {
        
        guard let error = error else { return nil }
        
        switch error.code {
        case URLError.Code.notConnectedToInternet.rawValue:
            return notConnectedToInternet
        case URLError.Code.timedOut.rawValue:
            return requestTimeout
        default:
            return error as? APIError
        }
        
    }
    
}


