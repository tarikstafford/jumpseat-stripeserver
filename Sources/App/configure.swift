import Vapor
import Stripe

/// Called before your application initializes.
///
/// https://docs.vapor.codes/3.0/getting-started/structure/#configureswift
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
   
    /// Register Stripe
    let config = StripeConfig(productionKey: "sk_test_5dpKrN3gcInoD3Uo0eVWIn5u", testKey: "sk_test_5dpKrN3gcInoD3Uo0eVWIn5u")
    services.register(config)
    try services.register(StripeProvider())
    
    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

}
