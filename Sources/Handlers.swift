import PerfectHTTP
import SQLiteStORM
import StORM

func processTarotDivination(request: HTTPRequest, _ response: HTTPResponse) {
    response.setHeader(.contentType, value: "application/json")

    var resp = [String: String]()
    
    guard let theType = String(request.param(name: "type")!) else {
        response.status = .badRequest
	resp["error"] = "Please supply type"
	do {
	    try response.setBody(json: resp)
	} catch {
            print(error)
	}
	response.completed()
	return
    }
    resp["type"] = theType
    do {
	try response.setBody(json: resp)
    } catch {
	print(error)
    }
    response.completed()
}
