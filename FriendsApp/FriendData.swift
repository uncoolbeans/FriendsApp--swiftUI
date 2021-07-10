//
//  FriendData.swift
//  FriendsApp
//
//  Created by MMS on 10/7/21.
//

import Foundation
import SwiftUI
let sampleFriends = [Friend(name: "YJ",
                                icon: "zzz",
                                school: "Tinkercademy",
                                slothImage: "sloth3",
                                description: "nutellazz", attack: 10,
                                defense: 5,
                                type: [.ice, .fire]),
                         Friend(name: "Jia Chen",
                                icon: "swift",
                                school: "Ngee Ann Poly",
                                slothImage: "sloth2",
                                description: "xcodeeee", attack: 15,
                                defense: 15,
                                type: [.electric, .ice]),
                         Friend(name: "Zerui",
                                icon: "wifi",
                                school: "NUS High",
                                slothImage: "sloth1",
                                description: "sususususus", attack: 6,
                                defense: 3,
                                type: [.normal, .grass, .fire])]
    
class FriendsData: ObservableObject {
    @Published var friends: [Friend] = []
    func getArchiveURL() -> URL{
        let plistName = "friends.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName)
    }
    func save(){
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(friends)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }
    func load(){
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalFriends: [Friend]!
        
        if let retrievedFriendsData = try? Data(contentsOf: archiveURL),
           let decodedFriends = try? propertyListDecoder.decode(Array<Friend>.self, from: retrievedFriendsData) {
            finalFriends = decodedFriends
        }else{
            finalFriends = sampleFriends
        }
        friends = finalFriends
    }
}
