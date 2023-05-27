//
//  MenuCell.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

class MenuCell: UITableViewCell {
    
    let menuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    let image = UIImageView()
    
    private let disposeBag = DisposeBag()
    
    var viewModel: CellType? {
        didSet {
            configureCell()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(menuLabel)
        addSubview(image)
        
        image.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(16)
            make.centerY.equalToSuperview()
        }
        menuLabel.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(14)
        }
        
    }
    
    private func configureCell() {
        guard let viewModel = viewModel else { return }
        menuLabel.text = viewModel.action
        image.image = viewModel.image
    }
}



