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
import RxDataSources

class MenuViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let menuItems: [CellType] = [.main, .vacancies, .responses, .profile, .exit]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        bindTableView()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-34)
        }
        
        tableView.rowHeight = 56 // Высота ячейки
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0)
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
        
        tableView.rx.willDisplayCell
            .subscribe(onNext: { cell, indexPath in
                if indexPath.row == self.menuItems.count - 1 {
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: cell.bounds.size.width)
                } else {
                    cell.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
                }
            })
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                self.handleSelection(self.menuItems[indexPath.row])
                self.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    private func handleSelection(_ item: CellType) {
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

