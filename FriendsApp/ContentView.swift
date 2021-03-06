//
//  ContentView.swift
//  FriendsApp
//
//  Created by MMS on 26/6/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var friends: [Friend]
    @State var isSheetPresented = false
    var body: some View {
        NavigationView {
            
            List {
                ForEach(friends) { friend in
                    let friendIndex = friends.firstIndex(of: friend)!
                    
                    NavigationLink(destination: FriendDetailView(friend: $friends[friendIndex])) {
                        Image(systemName: friend.icon)
                        
                        VStack(alignment: .leading) {
                            Text(friend.name)
                                .bold()
                            HStack {
                                Text(friend.school)
                                
                                Spacer()
                                
                                ForEach(friend.type, id: \.rawValue) { type in
                                    Image(systemName: type.getSymbolName())
                                }
                            }
                        }
                    }
                }.onDelete { offsets in
                    friends.remove(atOffsets: offsets)
                }.onMove { source, destination in
                    friends.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle("Friends")
            .navigationBarItems(leading: EditButton(),trailing: Button(action: {
                isSheetPresented = true
            }, label: {
                Image(systemName: "plus")
            }))
            
        }.sheet(isPresented: $isSheetPresented) {
            NewFriendView(friends: $friends)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(friends : .constant([Friend(name: "YJ",
                                       icon: "zzz",
                                       school: "Tinkercademy",
                                       slothImage: "sloth3",
                                       description: "nutella nutella nutella ????",
                                       attack: 10,
                                       defense: 5,
                                       type: [.electric,.normal]),
                                Friend(name: "Jia Chen",
                                       icon: "swift",
                                       school: "Ngee Ann Poly",
                                       slothImage: "sloth2", description: "i ?????? xcodee ???????????????",
                                       attack: 5,
                                       defense: 10,
                                       type: [.electric,.fire]),
                                
                                Friend(name: "Zerui",
                                       icon: "wifi",
                                       school: "NUS High",
                                       slothImage: "sloth1",
                                       description: "wifi is no more ????",
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
                                       type: [.ice,.electric,.grass])]))
    }
}

