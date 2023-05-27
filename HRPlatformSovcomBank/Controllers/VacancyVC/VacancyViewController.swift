//
//  VacancyViewController.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 25.05.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

class VacancyViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(VacancyCell.self, forCellReuseIdentifier: "VacancyCell")
        return tableView
    }()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindTableView()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func bindTableView() {
        // Пример данных
        let vacancies: [VacancyModel] = [
            VacancyModel(title: "Vacancy 1", company: "Company 1", tags: ["Tag 1", "Tag 2"]),
            VacancyModel(title: "Vacancy 2", company: "Company 2", tags: ["Tag 3", "Tag 4"]),
            VacancyModel(title: "Vacancy 3", company: "Company 3", tags: ["Tag 5", "Tag 6"])
        ]
        
        // Создаем источник данных для таблицы
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, VacancyModel>>(
            configureCell: { (_, tableView, indexPath, item) -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "VacancyCell", for: indexPath) as! VacancyCell
                cell.viewModel = item
                return cell
            }
        )
        
        // Создаем секцию и привязываем данные к таблице
        let sections = [SectionModel(model: "", items: vacancies)]
        Observable.just(sections)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

