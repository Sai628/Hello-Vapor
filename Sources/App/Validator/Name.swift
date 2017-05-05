//
//  Name.swift
//  Hello-Vapor
//
//  Created by Sai on 05/05/2017.
//
//

import Foundation

import Vapor


class Name: ValidationSuite
{
    static func validate(input value: String) throws
    {
        let evaluation = OnlyAlphanumeric.self && Count.min(5) && Count.max(20)
        try evaluation.validate(input: value)
    }
}
