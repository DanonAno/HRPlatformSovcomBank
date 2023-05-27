//
//  MenuViewController.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 27.05.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

class MenuViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    let menuItems: [CellType] = [.main, .vacancies, .responses, .profile, .exit]
    
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
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, CellType>>(
            configureCell: { dataSource, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
                cell.viewModel = item
                return cell
            }
        )
        
        let sections = [SectionModel(model: "", items: menuItems)]
        
        Observable.just(sections)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(CellType.self)
            .subscribe(onNext: { item in
                self.handleSelection(item)
            })
            .disposed(by: disposeBag)
    }
    
    private func handleSelection(_ item: CellType) {
        // Обработка выбора пункта меню
        switch item {
        case .main:
            print("Selected Main")
        case .vacancies:
            print("Selected Vacancies")
        case .responses:
            print("Selected Responses")
        case .profile:
            print("Selected Profile")
        case .exit:
            print("Selected Exit")
        }
    }
}

