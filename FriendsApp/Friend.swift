//
//  Friend.swift
//  FriendsApp
//
//  Created by MMS on 26/6/21.
//

import Foundation
struct Friend: Identifiable, Equatable, Codable{
    var id = UUID()
    var name: String
    var icon: String
    var school: String
    var slothImage: String
    var description: String
    var attack : Double
    var defense : Double
    var type: [FriendType]

}
