//
//  main.swift
//  Hello-Vapor
//
//  Created by Sai on 03/05/2017.
//
//

import Vapor


let drop = Droplet()


drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"],
    	"author": "Sai628"
    ])
}


drop.get("/hello") { _ in
    return "Hello Vapor"
}


drop.get("/test") { request in
    return "\(request)"
}


drop.get("/name", ":name") { request in
    
    if let name = request.parameters["name"]?.string
    {
        return "Hello \(name)"
    }
    
    return "Error retrieving parameters."
}


drop.resource("posts", PostController())
drop.middleware.append(RequestLogMiddleware())
drop.middleware.append(APIVersionMiddleware())

drop.run()
