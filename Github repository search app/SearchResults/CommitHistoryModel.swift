//
//  CommitHistoryModel.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 24/04/2022.
//

import Foundation


// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let url: String
    let sha, nodeID: String
    let htmlURL, commentsURL: String
    let commit: Commit
    let author, committer: WelcomeAuthor
    let parents: [Tree]

    enum CodingKeys: String, CodingKey {
        case url, sha
        case nodeID = "node_id"
        case htmlURL = "html_url"
        case commentsURL = "comments_url"
        case commit, author, committer, parents
    }
}

// MARK: - WelcomeAuthor
struct WelcomeAuthor: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

// MARK: - Commit
struct Commit: Codable {
    let url: String
    let author, committer: CommitAuthor
    let message: String
    let tree: Tree
    let commentCount: Int

    enum CodingKeys: String, CodingKey {
        case url, author, committer, message, tree
        case commentCount = "comment_count"
    }
}

// MARK: - CommitAuthor
struct CommitAuthor: Codable {
    let name, email: String
}

// MARK: - Tree
struct Tree: Codable {
    let url: String
    let sha: String
}

//struct CommitHistory: Codable {
//    let commit: Commit
//}
//
//struct Commit: Codable {
//    let author: Author
//    let message: String
//
//}
//struct Author: Codable {
//    let name: String
//    let email: String?
//}
