//
//  RequestLogMiddleware.swift
//  Hello-Vapor
//
//  Created by Sai on 05/05/2017.
//
//

import Foundation

import HTTP
import Vapor


class RequestLogMiddleware: Middleware
{
    func respond(to request: Request, chainingTo next: Responder) throws -> Response
    {
        drop.log.info("\(request)")
        return try next.respond(to: request)
    }
}
