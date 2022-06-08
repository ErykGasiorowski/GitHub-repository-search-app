//
//  SearchResource.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 12/04/2022.
//

import Foundation
import Moya

enum SearchResource: TargetType {
    
    case getSearchResults
    case getRepositoryDetails(String)
    case getCommits(String)
    
    var path: String {
        switch self {
        case .getSearchResults:
            return "search/repositories"
        case .getRepositoryDetails(let repo):
            return "repos/\(repo)"
        case .getCommits(let repo):
            return "repos/\(repo)/commits"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSearchResults, .getRepositoryDetails, .getCommits:
            return .get
        }
    }
    
    var headers: [String: String]? {
        return getHeaders()
    }
    
    var task: Task {
        switch self {
        case .getSearchResults:
            return .requestParameters(parameters: ["q":"=tetris"], encoding: URLEncoding.default)
            
        case .getRepositoryDetails:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
            
        case .getCommits:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
}

