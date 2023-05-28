//
//  VacancyStatusView.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 26.05.2023.
//

import UIKit
import SnapKit

class VacancyStatusView: UIView {
    let statusTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .red
        self.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.width.equalTo(40)
        }
        setupViews()
    }
    
    private func setupViews() {
        addSubview(statusTitle)
        
        statusTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(18)
            make.leading.trailing.equalToSuperview().inset(8)
        }
    }
}

