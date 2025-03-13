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

    app.get(".well-known", "assetlinks.json") { req -> Response in
            let content = """
[
{
"relation": ["delegate_permission/common.handle_all_urls"],
"target": {
"namespace": "android_app",
"package_name": "com.totalenergies.bellagio.paygo",
"sha256_cert_fingerprints":
["5E:21:FC:3A:93:05:91:B5:BB:35:75:63:1D:D3:DA:F2:BA:E1:D7:03:18:A3:C5:7B:EC:EC:51:11:1D:8B:91:C9"]
}
}]
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
