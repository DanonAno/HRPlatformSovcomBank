//
//  ProfileCell.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 28.05.2023.
//

import UIKit
import SnapKit

class ProfileCell: UITableViewCell {
    
    static let reuseIdentifier = "ProfileCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 16)
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(textField)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func configure(with item: ProfileItem) {
        switch item {
        case .firstName:
            titleLabel.text = "Имя"
        case .lastName:
            titleLabel.text = "Фамилия"
        case .desiredPosition:
            titleLabel.text = "Желаемая должность"
        case .location:
            titleLabel.text = "Местоположение"
        case .employmentType:
            titleLabel.text = "Тип занятости"
        case .phoneNumber:
            titleLabel.text = "Номер телефона"
        case .email:
            titleLabel.text = "Электронная почта"
        }
    }
}

