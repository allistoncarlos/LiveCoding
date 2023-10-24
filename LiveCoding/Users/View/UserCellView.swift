//
//  UserCellView.swift
//  LiveCoding
//
//  Created by Alliston Aleixo on 24/10/23.
//

import SwiftUI
import CachedAsyncImage

struct UserCellView: View {
    var user: User
    
    var body: some View {
        HStack(spacing: 50) {
            CachedAsyncImage(url: URL(string: user.pictureURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: { ProgressView().progressViewStyle(.circular) }
                .frame(height: 80)
            
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

#Preview {
    UserCellView(
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
