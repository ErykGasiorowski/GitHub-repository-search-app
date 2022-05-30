//
//  CommitsHistoryTableViewCell.swift
//  Github repository search app
//
//  Created by Eryk Gasiorowski on 20/04/2022.
//

import UIKit
import SnapKit
import Kingfisher
import RxSwift
import RxCocoa

class CommitsHistoryTableViewCell: UITableViewCell {

    struct Model {
        let authorsName: String?
        let authorsEmail: String?
        let commitMessage: String?
    }
    
    var disposeBag = DisposeBag()
    
    private let rowNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        label.layer.cornerRadius = 99
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private let commitAuthorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "COMMIT AUTHOR NAME"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemBlue
        label.numberOfLines = 1
        return label
    }()
    
    private let authorsEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "asdf@qwas.com"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private let commitMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a commit message that needs to fold over to the next line."
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        contentView.clipsToBounds = true
        //accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        rowNumberLabel.text = nil
        commitAuthorNameLabel.text = nil
        authorsEmailLabel.text = nil
        commitMessageLabel.text = nil
        disposeBag = DisposeBag()
    }
    
    func config(model: Model) {
        //rowNumberLabel.text =
        commitAuthorNameLabel.text = model.authorsName
        authorsEmailLabel.text = model.authorsEmail
        commitMessageLabel.text = model.commitMessage
        
    }

    func setupView() {
        contentView.backgroundColor = .white
        contentView.addSubview(rowNumberLabel)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(commitAuthorNameLabel)
        stackView.addArrangedSubview(authorsEmailLabel)
        stackView.addArrangedSubview(commitMessageLabel)
        //accessoryType = .disclosureIndicator

        rowNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(20)
            $0.centerY.equalToSuperview()
        }

        stackView.snp.makeConstraints {
            $0.leading.equalTo(rowNumberLabel.snp.leading).offset(20)
            $0.centerY.equalToSuperview()
        }
    }
}
