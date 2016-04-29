import Vapor
import VaporZewoMustache

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
