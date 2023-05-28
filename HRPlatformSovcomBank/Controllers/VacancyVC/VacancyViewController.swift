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
    
    var role: Int? = nil
    var userID: Int? = nil
    
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
        let url = URL(string: "http://158.160.34.74:8080/api/vacancies")!
        
        
        // Создаем источник данных для таблицы
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, ResponseModel>>(
            configureCell: { (_, tableView, indexPath, item) -> UITableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "VacancyCell", for: indexPath) as! VacancyCell
                cell.viewModel = item
                return cell
            }
        )
        var header: HTTPHeaders = [
            "Authorization": String(userID ?? 1)
        ]
        AF.request(url, headers: header).responseData { response in
            guard let data = response.data else { return }
            
            do {
                let responseModels = try JSONDecoder().decode([ResponseModel].self, from: data)
                print(responseModels)
                let sections = [SectionModel(model: "", items: responseModels)]
                Observable.just(sections)
                    .bind(to: self.tableView.rx.items(dataSource: dataSource))
                    .disposed(by: self.disposeBag)
            } catch {
                print("Error decoding JSON: \(error)")
            }
            
        }
    }
}
