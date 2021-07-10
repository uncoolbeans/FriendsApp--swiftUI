//
//  NewFriendView.swift
//  FriendsApp
//
//  Created by MMS on 10/7/21.
//

import SwiftUI

struct NewFriendView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var friends: [Friend]
    @State var friend = Friend(name: "",
                                   icon: "triangle",
                                   school: "",
                                   slothImage: "sloth3",
                                   description: "", attack: 0,
                                   defense: 0,
                                   type: [.normal])
    var body: some View {
        
        NavigationView {
            Form{
                Section(header: Text("Information")) {
                    TextField("Name", text: $friend.name)
                        .autocapitalization(.none)
                    TextField("School", text: $friend.school)
                        .autocapitalization(.none)
                    TextField("Description",text: $friend.description)
                        .autocapitalization(.none)
                    HStack {
                        Image(systemName: friend.icon)
                        TextField("Icon", text: $friend.icon)
                            .autocapitalization(.none)
                    }
                    TextField("Sloth Image", text: $friend.slothImage)
                        .autocapitalization(.none)
                    
                }
                
                Section(header: Text("Attributes")){
                    Section(header: Text("Attributes")) {
                        Picker("Type", selection: $friend.type[0]) {
                            Text("normal")
                                .tag(FriendType.normal)
                            Text("fire")
                                .tag(FriendType.fire)
                            Text("water")
                                .tag(FriendType.water)
                            Text("grass")
                                .tag(FriendType.grass)
                            Text("electric")
                                .tag(FriendType.electric)
                            Text("ice")
                                .tag(FriendType.ice)
                        }
                        HStack {
                            Text("Attack")
                                .frame(width: 100, alignment: .leading)
                            
                            Slider(value: $friend.attack,
                                   in: 0...15,
                                   step: 1)
                        }
                        
                        HStack {
                            Text("Defence")
                                .frame(width: 100, alignment: .leading)
                            
                            Slider(value: $friend.defense,
                                   in: 0...15,
                                   step: 1)
                        }
                    }
                    Section {
                        Button("Save") {
                            friends.append(friend)
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                        Button("Discard Friend") {
                            presentationMode.wrappedValue.dismiss()
                        }
                        .foregroundColor(.red)
                    }
                    
                }
            }.navigationTitle("New Friend")
        }
    }
}

struct NewFriendView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendView(friends: .constant([]))
    }
}


