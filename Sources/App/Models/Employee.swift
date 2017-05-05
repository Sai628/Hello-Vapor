//
//  Employee.swift
//  Hello-Vapor
//
//  Created by Sai on 05/05/2017.
//
//

import Foundation

import Vapor
import HTTP


class Employee
{
    var email: Valid<Email>
    var name: Valid<Name>
    
    
    init(request: Request) throws
    {
        email = try request.data["email"].validated()
        name = try request.data["name"].validated()
    }
}
