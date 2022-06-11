//
//  SearchResultsViewModel.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 20/04/2022.
//

import Foundation
import RxSwift
import RxCocoa

class SearchResultsViewModel: BaseViewModel {
    
    private let service: SearchService
    private let repo: String
    //private let commit: String
    
    let onSuccessRepo = PublishSubject<RepoImageView.Model>()
    //let onSuccessCommit = PublishSubject<CommitsHistoryTableViewCell.Model>()
    let onError = PublishSubject<String>()
    let details = PublishSubject<SearchResultsViewController.Details>()
    let repoUrl = PublishSubject<String>()
    let detailz = BehaviorRelay<[WelcomeElement]>(value: [])
    
    init(repo: String, service: SearchService = SearchServiceImpl()) {
        self.repo = repo
        self.service = service
    }
    
    func fetchData() {
        service.getCommits(repo: repo)
            .subscribe(onNext: { res in
                self.detailz.accept(res ?? [])
                //self.detailz.onNext(res)
                //self.details.accept(res)
            }, onError: { error in
                print(error)
            }).disposed(by: disposeBag)
    }
    
    func getDataForTableView() {
        service.getRepositoryDetails(repo: repo).subscribe(onNext: { result in
            let model = RepoImageView.Model(numberOfStars: result.stargazersCount, authorsName: result.owner.login, repoImage: result.owner.avatarURL)
            //let repoUrl = SearchResultsViewController.Details(repoUrl: result.url)
            
            self.onSuccessRepo.onNext(model)
            self.repoUrl.onNext(result.htmlURL)
            //self.details.onNext(repoUrl)
        }, onError: { [weak self] error in
            self?.onError.onNext(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
}

extension SearchResultsViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: String(describing: CommitsHistoryTableViewCell.self), for: indexPath) as? CommitsHistoryTableViewCell
        else {
            return UITableViewCell()
        }
        
        if detailz.value.count <= indexPath.row {
            return cell
        }
        
        let item = detailz.value[indexPath.row]
        
        
        cell.config(model: item)
        
        return cell
    }
}
