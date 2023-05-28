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
import Alamofire

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
        let url = URL(string: "http://158.160.34.74:8080/api/vacancies/")!
        
        // Создаем источник данных для таблицы
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, VacancyModel>>(
            configureCell: { (_, tableView, indexPath, item) -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "VacancyCell", for: indexPath) as! VacancyCell
                cell.viewModel = item
                return cell
            }
        )
        
        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            
            do {
                print("OGOGOGO", data)
                let vacancies = try JSONDecoder().decode([VacancyModel].self, from: data)
                
                // Создание секции данных для таблицы
                let sections = [SectionModel(model: "", items: vacancies)]
                
                // Привязка данных к таблице
                Observable.just(sections)
                    .bind(to: self.tableView.rx.items(dataSource: dataSource))
                    .disposed(by: self.disposeBag)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
}

