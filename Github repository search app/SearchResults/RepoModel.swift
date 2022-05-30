//
//  RepoModel.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 29/05/2022.
//

import Foundation

struct Repo: Codable {
    let id: Int
    let name, fullName: String
    let owner: RepoOwner
    let htmlURL: String
    let url: String
    let commitsURL: String
    let gitCommitsURL: String
    let stargazersCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case htmlURL = "html_url"
        case url
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case stargazersCount = "stargazers_count"
    }
}

struct RepoOwner: Codable {
    let login: String
    let id: Int
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL: String
    let reposURL: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case reposURL = "repos_url"
        case type
    }
}
