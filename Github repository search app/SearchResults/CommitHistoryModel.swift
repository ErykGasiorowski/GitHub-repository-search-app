//
//  CommitHistoryModel.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 24/04/2022.
//

import Foundation

struct CommitHistory: Codable {
    let commit: Commit
}

struct Commit: Codable {
    let author: Author
    let message: String
    
}
struct Author: Codable {
    let login: String
    let email: String?
}
