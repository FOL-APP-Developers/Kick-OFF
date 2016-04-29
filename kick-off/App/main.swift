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
    return "Request: \(request)"
}

app.post("block") { request in
    return "Request: \(request)"
}

app.get("reservations") { request in
    return "Request: \(request)"
}

app.delete("delete") { request in
    return "Request: \(request)"
}
    
print("Visit http://localhost:8080")
app.start(port: 8080)
