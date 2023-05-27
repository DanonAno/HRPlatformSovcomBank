//
//  ResumeCell.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import UIKit
import SnapKit

class ResumeCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = UIImage(named: "shareLink")
        return button
    }()
    
    let deleteCVButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = UIImage(named: "DeleteCV")
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = CGRect(x: contentView.frame.origin.x, y: contentView.frame.origin.y, width: 340, height: 168)
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(shareButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
        }
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.right.equalTo(contentView.snp.right).offset(20)
        }
        deleteCVButton.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(20)
            make.right.equalTo(contentView.snp.right).offset(20)
        }
    }
}
