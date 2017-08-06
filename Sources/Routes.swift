//
//  Routes.swift
//  PerfectArcade
//
//  Created by Jonathan Guthrie on 2016-10-13.
//
//

import PerfectHTTP

// This function creates the routes
// Handlers are in Handlers.swift

public func makeJSONRoutes(_ root: String = "/api/v1") -> Routes {
    var routes = Routes()
    
    routes.add(method: .post, uri: "\(root)/tarot/divination", handler: processTarotDivination)

    return routes
}
