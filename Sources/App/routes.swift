import Vapor

func routes(_ app: Application) throws {
    app.get(".well-known", "apple-app-site-association") { req -> Response in
        let content = """
{"applinks":{"details":[{"appIDs":["34Z37D37V7.com.wds.bellagio"],"paths":["/en/connector"]}]}, "appclips": {
        "apps": ["34Z37D37V7.com.wds.bellagio"]
    }}
"""
        var headers = HTTPHeaders()
        headers.add(name: .contentType, value: "application/json")
        return Response(status: .ok, headers: headers, body: .init(string: content))
    }
    app.get("en", "connector") { req async -> String in
        let id: String = req.query["id"]!
        return "Hello, world! \(id)"
    }

    app.get("RbAcFqHw") { req async -> Response in
        req.redirect(to: "/en/connector?id=FR*HPC*SNF001019*002")
    }
}
