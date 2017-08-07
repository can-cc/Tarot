import Vapor
import Foundation

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }

        try resource("posts", PostController.self)

        let filePath = "./data.txt"
        let handler = FileHandle(forWritingAtPath: filePath)
        let string = "添加一些文字到文件末尾"
        let appendedData = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        handler?.seekToEndOfFile()
        handler?.write(appendedData!)


        // let fileContents = try? String(contentsOfFile: "./fileName.txt", encoding: String.Encoding.utf8)
        // print(fileContents) // 输出字符串可选类型
    }
}
