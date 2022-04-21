//
//  RepoDetailsView.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 20/04/2022.
//

import UIKit
import SnapKit

class RepoDetailsView: UIView {
        
        private let repoTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Repo Title"
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            label.textColor = .black
            label.numberOfLines = 0
            return label
        }()
        
    private let viewOnlineButton: UIButton = {
        let button = UIButton()
        button.setTitle("VIEW ONLINE", for: .normal)
        button.backgroundColor = .systemGray5
        button.tintColor = .systemBlue
        
        return button
    }()
    
    private let commitsHistoryLabel: UILabel = {
            let label = UILabel()
            label.text = "Commits History"
            label.font = .systemFont(ofSize: 18, weight: .bold)
            label.textColor = .black
            label.numberOfLines = 1
            return label
        }()
        
    private let shareRepoButton: UIButton = {
        let button = UIButton()
        button.setTitle("VIEW ONLINE", for: .normal)
        button.backgroundColor = .systemGray5
        button.tintColor = .systemBlue
        
        return button
    }()
        
        override init(frame: CGRect) {
              super.init(frame: frame)
//            addSubview(repoImage)
//            addSubview(starImage)
//            addSubview(starsCountLabel)
//            addSubview(repoAuthorNameLabel)
//            addSubview(repoByLabel)
          }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            //layoutView()
        }
        
        func configure(with viewModel: SearchResultsViewModel) {
    //        repoAuthorNameLabel.text = viewModel.

        }
        
//        func layoutView() {
//
//            repoImage.snp.makeConstraints {
//                $0.top.bottom.leading.trailing.equalToSuperview()
//            }
//
//            starImage.snp.makeConstraints {
//                $0.bottom.equalTo(repoImage.snp.bottom).offset(-20)
//                $0.leading.equalTo(repoImage.snp.leading).offset(20)
//                $0.width.equalTo(12)
//                $0.height.equalTo(12)
//            }
//
//            starsCountLabel.snp.makeConstraints {
//                $0.leading.equalTo(starImage.snp.trailing).offset(2)
//                $0.bottom.equalTo(repoImage.snp.bottom).offset(-20)
//                $0.top.equalTo(starImage.snp.top)
//            }
//
//            repoAuthorNameLabel.snp.makeConstraints {
//                $0.bottom.equalTo(starImage.snp.top).offset(-10)
//                $0.leading.equalTo(repoImage.snp.leading).offset(20)
//            }
//
//            repoByLabel.snp.makeConstraints {
//                $0.bottom.equalTo(repoAuthorNameLabel.snp.top).offset(-10)
//                $0.leading.equalTo(repoImage.snp.leading).offset(20)
//            }
//        }
    }

