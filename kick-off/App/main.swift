import Vapor
import VaporZewoMustache
import Fluent

class Blocker: Model {
    static var entity: String = "Blocker"
    var id: String? = "idString"
    private var name: String?
    private var begin: Int?
    private var end: Int?
    private var reason: String?
    
    func serialize() -> [String: Value?] {
        return [
            "id": id,
            "name": name,
            "begin": begin,
            "end": end,
            "reason": reason
        ]
    }
    
    required init(serialized: [String: Value]) {
        self.name = serialized["name"]?.string
        self.begin = serialized["begin"]?.int
        self.end =  serialized["end"]?.int
        self.reason = serialized["reason"]?.string
    }
}

let app = Application()
if let driver = try? SQLiteDriver() {
    Database.driver = driver
}


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
        let name = json["name"]?.string,
        let begin = json["begin"]?.int,
        let end = json["end"]?.int,
        let reason = json["reason"]?.string else {
        return Json(["error": "unspecified"])
    }
    
    let blockerDict:[String: Value] = ["name": name,
                       "begin": begin,
                       "end": end,
                       "reason": reason]
    let blocker = Blocker(serialized: blockerDict)
    
    if let result = try? blocker.save() {
        return Json(["success": true])
    } else {
        return Json(["success": false])
    }
}

app.get("reservations") { request in
    return "Request: \(request)"
}

app.delete("delete") { request in
    return "Request: \(request)"
}

print("Visit http://localhost:8080")
app.start(port: 8080)
