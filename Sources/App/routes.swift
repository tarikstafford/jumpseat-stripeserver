import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    
    let stripeController = StripeController()
    router.post("createCustomer",use: stripeController.createCustomerId)
    router.post("ephKey", use: stripeController.getEphemeralKey)
    //router.post("createCard", use: stripeController.createCard)
}
