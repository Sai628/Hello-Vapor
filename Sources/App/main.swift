//
//  main.swift
//  Hello-Vapor
//
//  Created by Sai on 03/05/2017.
//
//

import Vapor
import HTTP


let drop = Droplet()


// Router Register
drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"],
    	"author": "Sai628"
    ])
}


drop.get("hello") { _ in
    return "Hello Vapor"
}


drop.get("test") { request in
    return "\(request)"
}


drop.get("name", ":name") { request in
    
    if let name = request.parameters["name"]?.string
    {
        return "Hello \(name)"
    }
    
    return "Error retrieving parameters."
}


drop.post("validation") { request in
    
    do
    {
        let employee = try Employee(request: request)
        print("employee email: \(employee.email.value)")
        print("employee name: \(employee.name.value)")
    }
    catch let error as ValidationError<Email>
    {
        return "Email is invalid"
    }
    catch let error as ValidationError<Name>
    {
        return "Name is invalid"
    }
    
    return "validation success"
}


// Router Nesting
drop.get("foo", "bar", "baz") { request in
    return "You requested /foo/bar/baz"
}


// Router Alternate
drop.add(.get, "alternate", "test") { request in
    return "alternate test"
}


// Response
drop.get("google") { request in
    return Response(redirect: "https://www.google.com")
}


// ResponseRepresentable
drop.get("json") { request in
    return try JSON(node: [
        "null": nil,
        "bool": false,
        "number": 123,
        "string": "unicorns",
        "array": ["a", 123, nil],
        "object": ["status": 1, "result": []]
    ])
}


// Router Throwing
drop.get("404") { request in
    throw Abort.notFound
}


drop.get("error") { request in
    throw Abort.custom(status: .badRequest, message: "Sorry 😱")
}


// Router Fallback
drop.get("anything", "*") { request in
    return "Matches anything after /anything"
}


drop.resource("posts", PostController())
drop.middleware.append(RequestLogMiddleware())
drop.middleware.append(APIVersionMiddleware())

drop.run()
