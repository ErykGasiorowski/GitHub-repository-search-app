//
//  SearchResultsViewController.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 20/04/2022.
//

import UIKit

class SearchResultsViewController: UIViewController {

//    var repoImageView = RepoImageView()
//    var repoDetailsView = RepoDetailsView()
    
    private let repoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "image")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let repoByLabel: UILabel = {
        let label = UILabel()
        label.text = "repo's author name"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private let repoAuthorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "repo's author name"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private let starsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of Stars ()"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        layoutView()
    }
    
    
    func layoutView() {
//        view.addSubview(repoImageView)
//        view.addSubview(repoDetailsView)
    
    }
}
