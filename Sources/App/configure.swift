import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

<<<<<<< HEAD
    // register routes
=======
    // Set local port
>>>>>>> e0072d63b931f64f159e8877ebd50af5d172319e
    guard let portString = Environment.get("VAPOR_LOCAL_PORT"),
          let port = Int(portString) else {
        fatalError("Failed to determine VAPOR LOCAL PORT from environment")
    }
    app.http.server.configuration.port = port

    // Set local host
    guard let hostname = Environment.get("VAPOR_LOCAL_HOST") else {
        fatalError("Failed to determine VAPOR LOCAL HOST from environment")
    }
    app.http.server.configuration.hostname = hostname
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> e0072d63b931f64f159e8877ebd50af5d172319e
=======
    
=======
>>>>>>> 5968deff40c451c657f9fd029bd4a6108f7facd2
    // register routes
>>>>>>> e0072d63b931f64f159e8877ebd50af5d172319e
    try routes(app)
}
