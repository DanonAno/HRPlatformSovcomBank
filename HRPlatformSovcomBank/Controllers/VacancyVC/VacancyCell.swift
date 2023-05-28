//
//  VacancyCell.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 25.05.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

class VacancyCell: UITableViewCell {
    private let vacancyTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .primary500
        return label
    }()
    
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .system900
        return label
    }()
    
    private let tagsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .system600
        label.numberOfLines = 0
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let statusView: VacancyStatusView = {
        let view = VacancyStatusView()
        return view
    }()
    
    private let disposeBag = DisposeBag()
    
    var viewModel: ResponseModel? {
        didSet {
            configureCell()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        statusView.statusTitle.text = "Новый"
        statusView.backgroundColor = .primary500
        statusView.layer.cornerRadius = 20
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(vacancyTitleLabel)
        containerView.addSubview(companyLabel)
        containerView.addSubview(tagsLabel)
        containerView.addSubview(statusView)
        
        containerView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
        }
        
        vacancyTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        companyLabel.snp.makeConstraints { make in
            make.top.equalTo(vacancyTitleLabel.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        tagsLabel.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
        statusView.snp.makeConstraints { make in
            make.top.equalTo(tagsLabel.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
            make.height.equalTo(38)
        }
    }
    
    private func configureCell() {
        guard let viewModel = viewModel else {
            return
        }
        
        vacancyTitleLabel.text = viewModel.title
        companyLabel.text = viewModel.company
        tagsLabel.text = viewModel.description
    }
}


