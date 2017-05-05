//
//  APIVersionMiddleware.swift
//  Hello-Vapor
//
//  Created by Sai on 05/05/2017.
//
//

import Foundation

import HTTP
import Vapor


class APIVersionMiddleware: Middleware
{
    func respond(to request: Request, chainingTo next: Responder) throws -> Response
    {
        let response = try next.respond(to: request)
        response.headers["API_VERSION"] = "v1.0"
        
        return response
    }
}
