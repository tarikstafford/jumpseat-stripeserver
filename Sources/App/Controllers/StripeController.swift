//
//  StripeController.swift
//  App
//
//  Created by Tarik Stafford on 11/4/18.
//

import Vapor
import Stripe

final class StripeController {
    
    func createCustomerId(_ req: Request) throws -> Future<StripeCustomer> {
        
        let stripeClient = try req.make(StripeClient.self)
        
//        let futCust = try req.content.decode(StripeCustomer.self)
        
        let input = try req.content.syncDecode(StripeCustomer.self)
        
        guard let email = input.email else { throw Abort(.badRequest, reason: "No Email Address")}
        
        let response = try stripeClient.customer.create(email: email)
        
//        return try futCust.flatMap(to: StripeCustomer.self, { customer in
//            let response = try stripeClient.customer.create(email: customer.email)
//            return response
//        })
        return response
    }
    
    func getEphemeralKey(_ req: Request) throws -> Future<StripeEphemeralKey> {
        
        let stripeClient = try req.make(StripeClient.self)
        
        return try req.content.decode(StripeCustomer.self).flatMap(to: StripeEphemeralKey.self, { (customer) in
            let response = try stripeClient.ephemeralKey.create(customer: customer.id!)
            return response
        })
    }
    
//    func createCard(_ req: Request) throws -> Future<String> {
//        
//         let stripeClient = try req.make(StripeClient.self)
//        
//        let customer = try req.content.syncDecode(StripeCustomer.self)
//        let credit = try req.content.syncDecode(StripeCard.self)
//        
//        let response = try stripeClient.token.createCard(card: credit.toEncodedDictionary(), customer: customer.id)
//    }
    
}
