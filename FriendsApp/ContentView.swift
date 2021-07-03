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
                          description: "nutella nutella nutella 🌰"),
                   Friend(name: "Jia Chen",
                          icon: "swift",
                          school: "Ngee Ann Poly",
                          slothImage: "sloth2", description: "i ❤️ xcodee 🧑🏼‍💻"),
                          
                   Friend(name: "Zerui",
                          icon: "wifi",
                          school: "NUS High",
                          slothImage: "sloth1",
                          description: "wifi is no more 🚫"),
                   Friend(name: "Bill",
                          icon: "pencil",
                          school: "Clementi Town Sec",
                          slothImage: "sloth2",
                          description: "dababy lessgoo")]
    var body: some View {
        NavigationView {
            List($friends) { friend in
                NavigationLink(destination: FriendDetailView(friend: friend)) {
                    Image(systemName: friend.wrappedValue.icon)
                
                VStack(alignment: .leading) {
                    Text(friend.wrappedValue.name).bold()
                    Text(friend.wrappedValue.school)
                    }
                }
            }.navigationTitle("Friends")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
