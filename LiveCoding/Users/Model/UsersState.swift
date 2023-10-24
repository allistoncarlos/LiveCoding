//
//  UsersState.swift
//  LiveCoding
//
//  Created by Alliston Aleixo on 24/10/23.
//

import Foundation

enum UsersState: Equatable {
    case idle
    case loading
    case success([User])
    case error(String)
}
