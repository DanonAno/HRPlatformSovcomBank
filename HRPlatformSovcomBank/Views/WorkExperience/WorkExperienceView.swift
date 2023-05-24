//
//  WorkExperienceView.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 24.05.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

class WorkExperienceView: UIView {
    private let disposeBag = DisposeBag()
    
    private var workExperiences: [WorkExperience] = []
    private let dataSource = RxTableViewSectionedReloadDataSource<WorkExperienceSectionModel>(
        configureCell: { dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkExperienceCell", for: indexPath) as! WorkExperienceCell
            cell.configure(with: item)
            return cell
        }
    )
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        tableView.register(WorkExperienceCell.self, forCellReuseIdentifier: "WorkExperienceCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addWorkExperience(WorkExperience(company: "Possible", position: "Media", years: "2"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // Добавление нового места работы
    private func addWorkExperience(_ workExperience: WorkExperience) {
        workExperiences.append(workExperience)
        tableView.reloadData()
    }
    
    func bindData() {
        print("OGO")
        Observable.just([WorkExperienceSectionModel(header: "Work Experience", items: workExperiences)])
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        print("OGO1")
    }
}
