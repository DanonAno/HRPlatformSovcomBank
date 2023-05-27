//
//  ProfileViewController.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

class ProfileViewController: UIViewController {
    
    let jobInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .system600
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let disposeBag = DisposeBag()
    
    let resumeTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ResumeCell.self, forCellReuseIdentifier: "ResumeCell")
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    let addResumeTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AddResumeCell.self, forCellReuseIdentifier: "AddResumeCell")
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    var data: [String] = ["Item 1", "Item 2", "Item 3"]
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .system300
        setupUI()
        bindTableView()
        bindSecondTableView()
    }
    
    private func setupUI() {
        view.addSubview(jobInfoLabel)
        view.addSubview(resumeTableView)
        view.addSubview(addResumeTableView)
        jobInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(8)
            make.left.equalTo(view.snp.left).offset(16)
        }
        
        resumeTableView.snp.makeConstraints { make in
            make.top.equalTo(jobInfoLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        addResumeTableView.snp.makeConstraints { make in
            make.top.equalTo(resumeTableView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func bindTableView() {
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>(
            configureCell: { _, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! ResumeCell
                cell.titleLabel.text = item
                return cell
            }
        )
        
        let sections = [SectionModel(model: "", items: data)]
        
        Observable.just(sections)
            .bind(to: resumeTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func bindSecondTableView() {
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>(
            configureCell: { _, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddResumeCell", for: indexPath) as! AddResumeCell
                return cell
            }
        )
        
        let section = SectionModel(model: "", items: ["Static Cell"])
        
        Observable.just([section])
            .bind(to: addResumeTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
}
