import Vapor
import Foundation

extension Droplet {
    func setupRoutes() throws {
        get("alive") { req in
            return "Hello, I am alive!"
        }

        get("draw") { request in
            guard let type = request.query?["type"]?.string else {
                let response = Response(status: .badRequest, body: "miss type")
                return response
            }
            let json = try draw(type: type)
            return json
        }
    }
}
