//
//  Swipe.swift
//  Storks
//
//  Created by Stephen Byron on 8/30/23.
//

import Foundation

struct Swipe: Identifiable, Codable {
    var id: String // Swipe ID
    var swipedUserId: String
    var swipingUserId: String
    var swipeType: SwipeType
}

enum SwipeType: String, Codable {
    case left
    case right
}

