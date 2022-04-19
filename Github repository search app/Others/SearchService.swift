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
    func getRepositoryDetails(query: String) -> Observable<SearchItems>
}

class SearchServiceImpl: BaseApiService<SearchResource>, SearchService {
    
    static var shared = SearchServiceImpl()
    
    func getSearchResults() -> Observable<SearchRepoModel> {
        return request(for: .getSearchResults)
            .map {(items: SearchRepoModel, _ response: Response) in
                return items
        }
    }
    
    func getRepositoryDetails(query: String) -> Observable<SearchItems> {
        return request(for: .getRepositoryDetails(query))
            .map {(item: SearchItems, _ response: Response) in
                return item
        }
    }
}
