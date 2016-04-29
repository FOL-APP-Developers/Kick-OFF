import PackageDescription

let package = Package(
    name: "VaporApp",
    dependencies: [
        .Package(url: "https://github.com/qutheory/vapor.git", majorVersion: 0, minor: 5),
        .Package(url: "https://github.com/qutheory/vapor-zewo-mustache.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/FOL-App-Devs/fluent-sqlite.git", majorVersion: 0)
    ],
    exclude: [
        "Deploy",
        "Public",
        "Resources",
		"Tests",
		"Database",
		"Libs"
    ]
)
