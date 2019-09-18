//
//  Error.swift
//  prueba iOS
//
//  Created by hno on 9/17/19.
//  Copyright © 2019 honorio. All rights reserved.
//

import Foundation

public class ErrorResponse:NSObject{
    private var typeError:String?
    private var codigo:Int?
    
    public  init(typeError:String) {
        self.typeError = typeError
    }
    public func getTypeError()->String?{
        return typeError
    }
}

class errorReport{
    static let shareErrorReport = errorReport()
    @objc dynamic private(set) var sourceError:ErrorResponse!
    func report(value:RequestError)->ErrorResponse {
        switch value {
        case .connectionError:
            print("")
            self.sourceError = ErrorResponse(typeError: "Comprueba tu conexión a Internet")
            break
        case .authorizationError(let errorJson):
            print("")
            self.sourceError = ErrorResponse(typeError: "authorizationError.VM")
            break
        case .accessDenied:
            self.sourceError = ErrorResponse(typeError: "Se agotó tiempo para realizar operación")
        case .notFound:
            print("")
            self.sourceError = ErrorResponse(typeError: "URL no encontrada")
            break
        case .serverError:
            print("")
            self.sourceError = ErrorResponse(typeError: "Error del servicio")
            break
        default:
            print("")
            self.sourceError = ErrorResponse(typeError: "Error desconocido")
        }
        return sourceError
    }
    
}
/********Error*****/
enum RequestError:Error{
    case unknownError
    case connectionError
    case authorizationError(Any)
    case accessDenied
    case notFound
    case serverError
}

enum ApiResult {
    case success(Any)
    case failure(RequestError)
}
