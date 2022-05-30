//
//  SearchViewModel.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 12/04/2022.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel: BaseViewModel {
    
    private let service: SearchService
    
    let searchResults = BehaviorRelay<[SearchItems]>(value: [])
    
    init(service: SearchService) {
        self.service = service
    }
    
    func fetchData() {
        service.getSearchResults()
            .subscribe(onNext: { res in
                self.searchResults.accept(res.items ?? [])
            }, onError: { error in
                print(error)
            }).disposed(by: disposeBag)
    }
    
    func navigateToDetails(_ repo: String?){
        if let repo = repo {
            AppNavigator.shared.navigate(to: SearchRoutes.details(repo), with: .push)
        }
    }
}

extension SearchViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: String(describing: SearchResultsTableViewCell.self), for: indexPath) as? SearchResultsTableViewCell
        else {
            return UITableViewCell()
        }
        
        if searchResults.value.count <= indexPath.row {
            return cell
        }
        
        let item = searchResults.value[indexPath.row]
        
        cell.button.rx.tap.asObservable().bind { [weak self] _ in
            self?.navigateToDetails(item.fullName)
        }.disposed(by: cell.disposeBag)
        
        cell.configure(model: item)
        
        return cell
    }
}
