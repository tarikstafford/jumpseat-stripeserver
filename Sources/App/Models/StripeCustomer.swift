//
//  StripeCustomer.swift
//  App
//
//  Created by Tarik Stafford on 11/4/18.
//

import Vapor
import FluentSQLite

/// A single entry of a Todo list.
final class StripeUser: SQLiteModel {
    
    /// The unique identifier for this `Todo`.
    var id: Int?
    
    /// Email
    var email: String
    
    /// A title describing what this `Todo` entails.
    var customerId: String?
    
    /// Creates a new `Todo`.
    init(id: Int? = nil, email: String, customerId: String? = nil) {
        self.id = id
        self.email = email
        self.customerId = customerId
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension StripeUser: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension StripeUser: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension StripeUser: Parameter { }
