//
//  SearchResultsViewController.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 20/04/2022.
//

import UIKit

class SearchResultsViewController: UIViewController {

    var repoImageView = RepoImageView()
    var repoDetailsView = RepoDetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        layoutView()
    }
    
    
    func layoutView() {
        view.addSubview(repoImageView)
        view.addSubview(repoDetailsView)
    }
}
