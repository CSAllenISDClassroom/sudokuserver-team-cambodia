import Vapor

func routes(_ app: Application) throws {
    app.get { req in
<<<<<<< HEAD
        return "It works!"
=======
        return "It works!! :D"
>>>>>>> e0072d63b931f64f159e8877ebd50af5d172319e
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
<<<<<<< HEAD

    
=======
>>>>>>> e0072d63b931f64f159e8877ebd50af5d172319e
}
