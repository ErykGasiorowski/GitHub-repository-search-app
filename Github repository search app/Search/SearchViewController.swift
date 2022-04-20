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
        
        bindToViewModel()
        viewModel.fetchCharacters()
        setupLayout()
        //
    }
    
    private func bindToViewModel() {
        viewModel.searchResults
                .subscribe(onNext: { drinks in
                    self.searchResultsTableView.reloadData()
                }).disposed(by: disposeBag)
        }
    
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

