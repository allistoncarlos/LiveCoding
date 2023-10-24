//
//  UsersViewModel.swift
//  LiveCoding
//
//  Created by Alliston Aleixo on 24/10/23.
//

import Foundation
import Combine

extension UsersView {
    @MainActor
    class UsersViewModel: ObservableObject {
        @Published var users: [User]? = nil
        @Published var state: UsersState = .idle
        
        init() {
            $state
                .receive(on: RunLoop.main)
                .sink { [weak self] state in
                    switch state {
                    case let .success(users):
                        self?.users = users
                    default:
                        break
                    }
                }.store(in: &cancellable)
        }

        func fetchData() async {
            state = .loading

            let result = await UserDataSource().fetchUsers()

            if let result {
                state = .success(result)
            } else {
                state = .error("Error loading server data")
            }
        }

        private var cancellable = Set<AnyCancellable>()
    }
}
