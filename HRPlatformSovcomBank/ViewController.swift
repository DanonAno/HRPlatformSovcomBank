//
//  ViewController.swift
//  HRPlatformSovcomBank
//
//  Created by  Даниил on 23.05.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let workView = WorkExperienceView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(workView)
        workView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        workView.bindData()
    }
}

