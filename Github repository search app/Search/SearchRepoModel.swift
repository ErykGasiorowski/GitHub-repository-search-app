//
//  SearchRepoModel.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 13/04/2022.
//

import Foundation

struct SearchRepoModel: Codable {
    var totalCount: Int?
    var incompleteResults: Bool
    var items: [SearchItems]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct SearchItems: Codable {
    let id: Int?
    let name: String
    let fullName: String
    let owner: Owner
    let htmlUrl: String?
    let stargazersCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case htmlUrl = "html_url"
        case stargazersCount = "stargazers_count"
    }
}

struct Owner: Codable {
    let login: String
    let id: Int?
    let avatarURL: String?
    let gravatarID: String?
    let url: String?
    let type: String?
    let htmlURL, reposURL: String?
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case type
        case htmlURL = "html_url"
        case reposURL = "repos_url"
    }
}
