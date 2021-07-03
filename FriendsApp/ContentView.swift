//
//  ContentView.swift
//  FriendsApp
//
//  Created by MMS on 26/6/21.
//

import SwiftUI

struct ContentView: View {
    @State var friends = [Friend(name: "YJ",
                                 icon: "zzz",
                                 school: "Tinkercademy",
                                 slothImage: "sloth3",
                                 description: "nutella nutella nutella 🌰",
                                 attack: 10,
                                 defense: 5,
                                 type: [.electric,.normal]),
                          Friend(name: "Jia Chen",
                                 icon: "swift",
                                 school: "Ngee Ann Poly",
                                 slothImage: "sloth2", description: "i ❤️ xcodee 🧑🏼‍💻",
                                 attack: 5,
                                 defense: 10,
                                 type: [.electric,.fire]),
                          
                          Friend(name: "Zerui",
                                 icon: "wifi",
                                 school: "NUS High",
                                 slothImage: "sloth1",
                                 description: "wifi is no more 🚫",
                                 attack: 15,
                                 defense: 0,
                                 type: [.fire,.grass]),
                          Friend(name: "Bill",
                                 icon: "pencil",
                                 school: "Clementi Town Sec",
                                 slothImage: "sloth2",
                                 description: "dababy lessgoo",
                                 attack: 10,
                                 defense: 10,
                                 type: [.ice,.electric,.grass])]
    var body: some View {
        NavigationView {
            List(0..<friends.count) { index in
                NavigationLink(destination: FriendDetailView(friend: $friends[index])) {
                    Image(systemName: friends[index].icon)
                    
                    VStack(alignment: .leading) {
                        Text(friends[index].name)
                            .bold()
                        HStack {
                            Text(friends[index].school)
                            Spacer()
                            ForEach(friends[index].type, id: \.rawValue) { type in
                                                            Image(systemName: type.getSymbolName())
                        }
                    }
                }
            }
            .navigationTitle("Friends")
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
