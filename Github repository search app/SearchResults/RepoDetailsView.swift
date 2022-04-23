//
//  RepoDetailsView.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 20/04/2022.
//

import UIKit
import SnapKit

class RepoDetailsView: UIView {
        
    let repoDetailsTableView: UITableView = UITableView()
    
    private let repoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Repo Title"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
        
    private let viewOnlineButton: UIButton = {
        let button = UIButton()
        button.setTitle("VIEW ONLINE", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private let commitsHistoryLabel: UILabel = {
            let label = UILabel()
            label.text = "Commits History"
            label.font = .systemFont(ofSize: 22, weight: .bold)
            label.textColor = .black
            label.numberOfLines = 1
            return label
        }()
        
    private let shareRepoButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = UIImage(named: "shareIcon")
        button.setTitle("Share Repo", for: .normal)
        button.backgroundColor = .systemGray6
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 6
        
        return button
    }()
        
        override init(frame: CGRect) {
              super.init(frame: frame)
            addSubview(repoTitleLabel)
            addSubview(viewOnlineButton)
            addSubview(commitsHistoryLabel)
            addSubview(shareRepoButton)
            //addSubview(tableView)
          }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            layoutView()
        }
        
//        func configure(with viewModel: SearchResultsViewModel) {
//    //        repoAuthorNameLabel.text = viewModel.
//
//        }
        
        func layoutView() {

            repoTitleLabel.snp.makeConstraints {
                $0.top.leading.equalToSuperview().offset(20)
            }

            viewOnlineButton.snp.makeConstraints {
                $0.top.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.height.equalTo(repoTitleLabel)
                $0.width.equalTo(110)
            }

            commitsHistoryLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(20)
                $0.top.equalTo(repoTitleLabel.snp.bottom).offset(40)
            }

            shareRepoButton.snp.makeConstraints {
                $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-40)
                $0.width.equalToSuperview().multipliedBy(0.9)
                $0.height.equalTo(50)
                $0.centerX.equalToSuperview()
            }
            
//            repoDetailsTableView.register(CommitsHistoryTableViewCell.self, forCellReuseIdentifier: String(describing: CommitsHistoryTableViewCell.self))
//            repoDetailsTableView.translatesAutoresizingMaskIntoConstraints = true
//            //repoDetailsTableView.delegate = viewModel
//            //repoDetailsTableView.dataSource = viewModel
//            repoDetailsTableView.backgroundColor = .white
////            repoDetailsTableView.rowHeight = 90
//            
//            var frame = CGRect.zero
//            
//            repoDetailsTableView.frame.size.height = .leastNormalMagnitude
//            repoDetailsTableView.tableHeaderView = UIView(frame: frame)
//            repoDetailsTableView.tableFooterView = UIView(frame: frame)
//            repoDetailsTableView.separatorStyle = .none
//            
//            repoDetailsTableView.snp.makeConstraints {
//                $0.top.equalTo(commitsHistoryLabel.snp.bottom).offset(10)
//                $0.width.equalToSuperview().multipliedBy(0.9)
//                $0.centerX.equalToSuperview()
//                $0.bottom.equalTo(shareRepoButton.snp.top).offset(-20)
//            }
        }
    }

