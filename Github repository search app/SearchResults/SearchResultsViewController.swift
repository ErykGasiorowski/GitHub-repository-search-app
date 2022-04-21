//
//  SearchResultsViewController.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 20/04/2022.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SearchResultsViewController: UIViewController {

    var repoImageView = RepoImageView()
//    var repoDetailsView = RepoDetailsView()    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layoutView()
    }
    
    
    func layoutView() {
        view.addSubview(repoImageView)
//        view.addSubview(repoDetailsView)
        
        repoImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(3)
        }
    
    }
}
