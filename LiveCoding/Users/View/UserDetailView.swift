//
//  UserDetailView.swift
//  LiveCoding
//
//  Created by Alliston Aleixo on 24/10/23.
//

import SwiftUI
import CachedAsyncImage

struct UserDetailView: View {
    var user: User
    
    var body: some View {
        VStack(spacing: 15) {
            CachedAsyncImage(url: URL(string: user.pictureURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: { ProgressView().progressViewStyle(.circular) }
                .frame(height: 160)
            
            
            Text("\(user.firstName) \(user.lastName)")
                .font(.title)
            
            Text(user.email)
                .font(.title2)
            
            Text("Gender: \(user.gender)")
                .font(.caption)
            
            Text("Phone: \(user.phone)")
                .font(.caption)
            
            Text("Birthday: \(user.birthday)")
                .font(.caption)
            
            Text("Twitter: \(user.twitterHandle)")
                .font(.caption)
            
            Spacer()
        }
    }
}

#Preview {
    UserDetailView(
        user: User(
            id: 1,
            firstName: "Teste",
            lastName: "Teste",
            username: "testeteste",
            email: "teste@teste.com",
            gender: "Male",
            pictureURL: "https://placehold.it/400",
            phone: "+551212341234",
            birthday: "01/01/1900",
            twitterHandle: "None"
        )
    )
}
