//
//  RequestError.swift
//  Ecommerce-MVP
//
//  Created by Lucas Soares on 10/08/17.
//  Copyright © 2017 Lucas M Soares. All rights reserved.
//

enum RequestError {
    case generic
    case invalidRequisition
    case noAutorized
    case badGateway
    case timeOut
    
    var code: Int {
        switch self {
        case .invalidRequisition: return 400
        case .noAutorized: return 403
        case .badGateway: return 502
        case .timeOut: return 504
        default: return 0
        }
    }
    
    var description: String {
        switch self {
        case .invalidRequisition: return "Requisição inválida"
        case .noAutorized: return "Requisição inválida"
        case .badGateway: return "Requisição ruim"
        case .timeOut: return "Tempo de resposta excedido"
        default: return "Erro não mapeado"
        }
    }
    
    init(code: Int) {
        switch code {
        case 400: self = .generic
        case 403: self = .generic
        case 502: self = .generic
        case 504: self = .generic
        default: self = .generic
        }
    }
}
