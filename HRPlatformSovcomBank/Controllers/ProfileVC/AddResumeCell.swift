//
//  AddResumeCell.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import UIKit
import SnapKit

class AddResumeCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .system900
        label.text = "Добавить резюме"
        return label
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
        contentView.frame = CGRect(x: contentView.frame.origin.x, y: contentView.frame.origin.y, width: 340, height: 62)
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(20)
        }
    }
}
