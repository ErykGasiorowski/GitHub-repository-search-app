//
//  RepoImageView.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 20/04/2022.
//

import UIKit
import SnapKit

class RepoImageView: UIView {

    private let repoImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "image")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemCyan
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let repoByLabel: UILabel = {
        let label = UILabel()
        label.text = "REPO BY"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray4
        label.numberOfLines = 1
        return label
    }()
    
    private let repoAuthorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Repo Author Name"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private let starsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of Stars (234)"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray4
        label.numberOfLines = 1
        return label
    }()
    
    private let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemGray4
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
          super.init(frame: frame)
        addSubview(repoImage)
        addSubview(starImage)
        addSubview(starsCountLabel)
        addSubview(repoAuthorNameLabel)
        addSubview(repoByLabel)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutView()
    }
    
    func configure(with viewModel: SearchResultsViewModel) {
//        repoAuthorNameLabel.text = viewModel.

    }
    
    func layoutView() {
        
        repoImage.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        starImage.snp.makeConstraints {
            $0.bottom.equalTo(repoImage.snp.bottom).offset(-20)
            $0.leading.equalTo(repoImage.snp.leading).offset(20)
            $0.width.equalTo(12)
            $0.height.equalTo(12)
        }
        
        starsCountLabel.snp.makeConstraints {
            $0.leading.equalTo(starImage.snp.trailing).offset(2)
            $0.bottom.equalTo(repoImage.snp.bottom).offset(-20)
            $0.top.equalTo(starImage.snp.top)
        }
        
        repoAuthorNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(starImage.snp.top).offset(-10)
            $0.leading.equalTo(repoImage.snp.leading).offset(20)
        }
        
        repoByLabel.snp.makeConstraints {
            $0.bottom.equalTo(repoAuthorNameLabel.snp.top).offset(-10)
            $0.leading.equalTo(repoImage.snp.leading).offset(20)
        }
    }
}
