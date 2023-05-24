//
//  WorkExperienceCell.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 24.05.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

class WorkExperienceCell: UITableViewCell {
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let positionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let yearsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(companyLabel)
        contentView.addSubview(positionLabel)
        contentView.addSubview(yearsLabel)
        
        companyLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
        }
        
        positionLabel.snp.makeConstraints { make in
            make.leading.equalTo(companyLabel)
            make.top.equalTo(companyLabel.snp.bottom).offset(4)
        }
        
        yearsLabel.snp.makeConstraints { make in
            make.leading.equalTo(companyLabel)
            make.top.equalTo(positionLabel.snp.bottom).offset(4)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    func configure(with workExperience: WorkExperience) {
        companyLabel.text = workExperience.company
        positionLabel.text = workExperience.position
        yearsLabel.text = workExperience.years
    }
}
