import Vapor
import VaporZewoMustache
import Fluent

class Blub: Model {
    static var entity: String = "blub"
    var id: String?
    
    func serialize() -> [String: Value?] {
        return [:]
    }
    
    required init(serialized: [String: Value]) {
        
    }
}

let blub = Blub(serialized: ["foo": "bar"])

let to = Query<Blub>()

try? to.save(blub)

let app = Application()

app.get("available") { request in
    return "Request: \(request)"
}

app.post("reserve") { request in
    guard let json = request.data.json,
        let name = json["name"],
        let timestamp = json["time"],
        let players = json["players"] else {
            return Json(["error": "unspecified"])
    }
    
    return Json(["success": true])
}

app.post("block") { request in
    guard let json = request.data.json,
        let name = json["name"],
        let begin = json["begin"],
        let end = json["end"],
        let reason = json["reason"] else {
        return Json(["error": "unspecified"])
    }

    return Json(["success": true])
}

app.get("reservations") { request in
    return "Request: \(request)"
}

app.delete("delete") { request in
    return "Request: \(request)"
}

print("Visit http://localhost:8080")
app.start(port: 8080)
