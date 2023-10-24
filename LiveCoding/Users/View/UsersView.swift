//
//  UsersView.swift
//  LiveCoding
//
//  Created by Alliston Aleixo on 24/10/23.
//

import SwiftUI

struct UsersView: View {
    @ObservedObject var viewModel: UsersView.UsersViewModel
    @State var isLoading = true
    
    var body: some View {
        NavigationStack {
            VStack {
                if let users = viewModel.users {
                    List(users, id: \.id) { user in
                        NavigationLink(value: user) {
                            UserCellView(user: user)
                        }
                    }
                }
            }
            .overlay(
                isLoading ? ProgressView() : nil
            )
            .disabled(isLoading)
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .onChange(of: viewModel.state, { oldValue, newValue in
                isLoading = newValue == .loading
            })
            .task {
                await viewModel.fetchData()
            }
        }
    }
}

#Preview {
    UsersView(viewModel: UsersView.UsersViewModel())
}
