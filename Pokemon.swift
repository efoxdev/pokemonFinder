//
//  Pokemon.swift
//  Startrivia
//
//  Created by Ethan Fox on 1/27/21.
//

import Foundation

struct Pokemon : Codable {
    
    let name : String
    let order : String
    let abilities : [String]
    let height : String
    let weight : String
    let heldItems : String
    let moves : [String]
    let types : [String]
    
    
    // Used when using Codable
//    enum CodingKeys : String, CodingKey {
//        case name
//        case order = "id"
//        case abilities
//        case height
//        case weight
//        case heldItems = "held_items"
//        case moves
//        case types
//    }
//
}
