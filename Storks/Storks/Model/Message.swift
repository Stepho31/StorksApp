//
//  Message.swift
//  Storks
//
//  Created by Stephen Byron on 8/30/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String // Message ID
    var senderId: String
    var receiverId: String
    var messageContent: String
    var timestamp: Date
}
