//
//  FriendDetailView.swift
//  FriendsApp
//
//  Created by MMS on 26/6/21.
//

import SwiftUI

struct FriendDetailView: View {
    
    @Binding var friend : Friend
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image(friend.slothImage).resizable()
                    .frame(height: 300)
                    
                Image(friend.name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .mask(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 8)
                            .foregroundColor(.white)
                    )
                    .offset(x: 0, y: -250 / 2)
                    .shadow(radius: 6)
                    .padding(.bottom, -250 / 2)
                Text("\(Image(systemName: friend.icon)) \(friend.school)")
                    .font(.system(size: 24))
                    .padding()
                Text("About me: \(friend.description)")
                    .font(.body)
                VStack(alignment: .leading){
                    Text("Attack ⚔️")
                    Slider(value: $friend.attack,
                           in: 0...15,
                           step: 1)
                    Text("Defense 🛡")
                    Slider(value: $friend.defense,
                           in: 0...15,
                           step: 1)
                    
                }.padding()
                Spacer()
                    
            }.navigationTitle(friend.name)
        }
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView( friend: .constant(Friend(name: "Jia Chen",
                                                                    icon: "pc",
                                                                    school: "Tinkercademy",
                                                                    slothImage: "sloth1", description: "xcode good other languages bad",
                                                                    attack: 10,
                                        defense:10)))
    }
}
