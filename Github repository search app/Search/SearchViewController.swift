//
//  SearchViewController.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 11/04/2022.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var viewModel: SearchViewModel!
    let disposeBag = DisposeBag()
    let searchResultsTableView: UITableView = UITableView()
    
    let searchController: UISearchController = {
        // TODO: Prepare another vc for search results
        let vc = UISearchController()
        vc.searchBar.placeholder = "Search for repository"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        
        vc.searchBar.tintColor = .systemGray
        
        return vc
    }()

    
    let repositoriesTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Repositories"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Search"

        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.largeTitleDisplayMode = .always
        
        setupLayout()
        bindToViewModel()
        setupLayout()
        viewModel.fetchData()
    }
    
    private func bindToViewModel() {
        viewModel.searchResults
                .subscribe(onNext: { res in
                    self.searchResultsTableView.reloadData()
                }).disposed(by: disposeBag)
        }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let query = searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        viewModel.query = searchBar.text!
        
        bindToViewModel()
        viewModel.fetchData()
        self.searchResultsTableView.reloadData()
//        private func bindToViewModel() {
//            viewModel.detailz.subscribe(onNext: { res in
//                        self.repoDetailsTableView.reloadData()
//                    }).disposed(by: disposeBag)
//            }
//
        
        //self.repoDetailsTableView.reloadData()
        
        //resultsController.delegate = self
        
        // Perform search
        
    }
//            func update(with results: SearchItems) {
//                let searchResults = results.filter ({
//                    switch $0 {
//                    case .: return true
//                    default: return false
//                    }
//                })
//
//                searchResultsTableView.reloadData()
//                searchResultsTableView.isHidden = results.isEmpty
//            }
////
    
    func updateSearchResults(for searchController: UISearchController) {
        //
    }
    
    func setupLayout() {
        
        view.addSubview(repositoriesTitleLabel)
        view.addSubview(searchResultsTableView)
        searchResultsTableView.register(SearchResultsTableViewCell.self, forCellReuseIdentifier: String(describing: SearchResultsTableViewCell.self))
        searchResultsTableView.translatesAutoresizingMaskIntoConstraints = false
        searchResultsTableView.delegate = viewModel
        searchResultsTableView.dataSource = viewModel
        searchResultsTableView.backgroundColor = .white
        searchResultsTableView.rowHeight = 90
        
        var frame = CGRect.zero
        
        searchResultsTableView.frame.size.height = .leastNormalMagnitude
        searchResultsTableView.tableHeaderView = UIView(frame: frame)
        searchResultsTableView.tableFooterView = UIView(frame: frame)
        searchResultsTableView.separatorStyle = .none
        
        repositoriesTitleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets).offset(140)
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.centerX.equalToSuperview()
        }
        
        searchResultsTableView.snp.makeConstraints {
            $0.top.equalTo(repositoriesTitleLabel.snp.bottom).offset(20)
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

