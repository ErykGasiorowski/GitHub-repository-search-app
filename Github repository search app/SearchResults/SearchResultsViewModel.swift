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
    
    let onSuccess = PublishSubject<RepoImageView.Model>()
    let onError = PublishSubject<String>()
    let details = PublishSubject<Repo>()
    //let details = BehaviorRelay<[SearchItems]>(value: [])
    
    init(repo: String, service: SearchService = SearchServiceImpl()) {
        self.repo = repo
        self.service = service
    }
    
    func fetchData() {
        service.getRepositoryDetails(repo: repo)
            .subscribe(onNext: { res in
                self.details.onNext(res)
                //self.details.accept(res)
            }, onError: { error in
                print(error)
            }).disposed(by: disposeBag)
    }
    
    func getDataForTableView() {
        service.getRepositoryDetails(repo: repo).subscribe(onNext: { result in
            let model = RepoImageView.Model(numberOfStars: result.stargazersCount, authorsName: result.owner.login, repoImage: result.owner.avatarURL)
            
            self.onSuccess.onNext(model)
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
        
//        if details.value.count <= indexPath.row {
//            return cell
//        }
        
        //let item = details.value[indexPath.row]
        
        
        
//        cell.button.rx.tap.asObservable().bind { [weak self] _ in
//            self?.navigateToDetails(item.name ?? "-")
//        }.disposed(by: cell.disposeBag)
        
        //cell.config(model: onSuccess)
        
        return cell
    }
}
