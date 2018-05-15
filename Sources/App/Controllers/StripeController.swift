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
        
        let input = try req.content.syncDecode(StripeCustomer.self)
        
        guard let email = input.email else { throw Abort(.badRequest, reason: "No Email Address")}
        
        let response = try stripeClient.customer.create(email: email)
    
        return response
    }
    
    func getEphemeralKey(_ req: Request) throws -> Future<StripeEphemeralKey> {
        
        let stripeClient = try req.make(StripeClient.self)
        
        let customer = try req.content.syncDecode(StripeCustomer.self)
        
        guard let customerId = customer.id else { throw Abort(.badRequest, reason: "No Customer Id")}
        
        let response = try stripeClient.ephemeralKey.create(customer: customerId)
        
        return response
    }
    
    func getCustomer(_ req: Request) throws -> Future<StripeCustomer> {
        
        let stripeClient = try req.make(StripeClient.self)
        
        let input = try req.content.syncDecode(StripeCustomer.self)
        
        guard let customerId = input.id else { throw Abort(.badRequest, reason: "No Customer Id")}
        
        let response = try stripeClient.customer.retrieve(customer: customerId)
        
        return response
    }
    
    func createCharge(_ req: Request) throws -> Future<StripeCharge> {
        
        let stripeClient = try req.make(StripeClient.self)
        
        let input = try req.content.syncDecode(StripeCharge.self)
        
        let customer = try req.content.syncDecode(StripeCustomer.self)
        
        guard let amount = input.amount else { throw Abort(.badRequest, reason: "No Amount")}
        
        guard let currency = input.currency else { throw Abort(.badRequest, reason: "No Currency")}
        
        guard let id = customer.id else {throw Abort(.badRequest, reason: "No Customer")}
        
        return try stripeClient.charge.create(amount: amount, currency: currency, customer: id)
    }
    
//    func submitToken(_ req: Request) throws -> Future<StripeToken> {
//        
//        let stripeClient = try req.make(StripeClient.self)
//        
//    }
//    
}
