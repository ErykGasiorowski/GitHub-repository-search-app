//
//  SearchResultsTableViewCell.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 14/04/2022.
//

import UIKit
import Kingfisher
import SnapKit
import RxSwift
import RxCocoa

class SearchResultsTableViewCell: UITableViewCell {
    
    var disposeBag = DisposeBag()
    
    let button = UIButton()
    
    private let ownerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "image")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 9
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let repoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "repo title"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "star")
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let starsLabel: UILabel = {
        let label = UILabel()
        label.text = "number of stars from endpoint"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setupView()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        ownerImage.image = nil
        repoTitleLabel.text = nil
        starsLabel.text = nil
        disposeBag = DisposeBag()
    }
    
    func configure(model: SearchItems) {
        ownerImage.kf.setImage(with: URL(string: model.owner.avatarURL ?? ""))
        repoTitleLabel.text = model.name
        
        if let stars = model.stargazersCount {
            starsLabel.text = String(stars)
        }
        else {
            starsLabel.text = "-"
        }
    }

    func setupView() {
        //button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ownerImage)
        contentView.addSubview(repoTitleLabel)
        contentView.addSubview(starImage)
        contentView.addSubview(starsLabel)
        contentView.addSubview(button)

        ownerImage.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.bottom.equalTo(contentView.snp.bottom).inset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
            $0.centerY.equalTo(contentView.snp.centerY)
        }

        repoTitleLabel.snp.makeConstraints{
            $0.leading.equalTo(ownerImage.snp.trailing).offset(10)
            $0.bottom.equalTo(ownerImage.snp.centerY)
            $0.trailing.equalTo(contentView.snp.trailing)
        }
        
        starImage.snp.makeConstraints{
            $0.leading.equalTo(ownerImage.snp.trailing).offset(10)
            $0.top.equalTo(ownerImage.snp.centerY)
        }
        
        repoTitleLabel.snp.makeConstraints{
            $0.leading.equalTo(starImage.snp.trailing).offset(2)
            $0.top.equalTo(ownerImage.snp.centerY)
            $0.trailing.equalTo(contentView.snp.trailing)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing)
        }
    }
}
