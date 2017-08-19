import Vapor
import Foundation

func generateAllCardId() -> Array<String> {
    let m = (0...21).map{"M\($0)"}
    let p = (1...21).map{"P\($0)"}
    let s = (1...21).map{"S\($0)"}
    let w = (1...21).map{"W\($0)"}
    let c = (1...21).map{"C\($0)"}
    return m + p + s + w + c
}

func generateCardReverse() -> Bool {
    let dice = Int(arc4random_uniform(10));
    return dice > 5
}

func draw(type: String) throws -> JSON {
    var json = JSON()
    try json.set("type", type)
    switch type {
    case "single":
        var card = JSON()
        let allCard = generateAllCardId()
        let pickedCardId = Int(arc4random_uniform(UInt32(allCard.count)))
        try card.set("id", allCard[pickedCardId])
        try card.set("reverse", generateCardReverse())
        try json.set("result", [card])
    default:
        try json.set("message", "unknown type")
        try json.set("error", true)
    }
    return json
}
