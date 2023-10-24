//
//  User.swift
//  LiveCoding
//
//  Created by Alliston Aleixo on 24/10/23.
//

import Foundation

struct User: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let gender: String
    let pictureURL: String
    let phone: String
    let birthday: String
    let twitterHandle: String

    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, username, email, gender, pictureURL, phone, birthday, twitterHandle
    }
}
