//
//  User.swift
//  Storks
//
//  Created by Stephen Byron on 8/30/23.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String 
    var email: String
    var name: String
    var age: Int
    var gender: String
    var location: String
    var parentalStatus: ParentalStatus
    var profilePictures: [String]
    var bio: String
}

struct ParentalStatus: Codable {
    var numberOfChildren: Int
    var agesOfChildren: [Int]
}
