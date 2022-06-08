//
//  SearchService.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 12/04/2022.
//

import Foundation
import RxSwift
import Moya

protocol SearchService {
    func getSearchResults() -> Observable<SearchRepoModel>
    func getRepositoryDetails(repo: String) -> Observable<Repo>
    func getCommits(repo: String) -> Observable<[WelcomeElement]>
}

class SearchServiceImpl: BaseApiService<SearchResource>, SearchService {
    
    static var shared = SearchServiceImpl()
    
    func getSearchResults() -> Observable<SearchRepoModel> {
        return request(for: .getSearchResults)
            .map {(items: SearchRepoModel, _ response: Response) in
                return items
        }
    }
    
    func getRepositoryDetails(repo: String) -> Observable<Repo> {
        return request(for: .getRepositoryDetails(repo))
            .map {(item: Repo, _ response: Response) in
                return item
        }
    }
    
    func getCommits(repo: String) -> Observable<[WelcomeElement]> {
        return request(for: .getCommits(repo))
            .map {(item: [WelcomeElement], _ response: Response) in
                return item
        }
    }
}
