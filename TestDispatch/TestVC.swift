//
//  TestVC.swift
//  TestDispatch
//
//  Created by 劉戰軍 on 2019/3/28.
//  Copyright © 2019年 liuzhanjun. All rights reserved.
//
import UIKit

class TestVC: UIViewController {
    
    public var allHeight = [String: CGFloat]()
    
    lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.delegate = self
        temp.dataSource = self
        temp .register(TestTableViewCell.self, forCellReuseIdentifier: TestTableViewCell.description())
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        tableView.estimatedRowHeight = 500;
        tableView.reloadData()
    }
}

extension TestVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        debugPrint("cellForRowAt")
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.description(), for: indexPath) as? TestTableViewCell else { return UITableViewCell() }
        
        cell.content = "获取 = \(indexPath.row)"
        let key = String(format: "ip:(%u,%u)", indexPath.section, indexPath.row)
        if !allHeight.keys.contains(key) {
            let value = cell.dynamicHeight
            allHeight[key] = value
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        debugPrint("heightForRowAt")
        
        let key = String(format: "ip:(%u,%u)", indexPath.section, indexPath.row)
        guard let height = allHeight[key] else { return 0 }
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        let key = String(format: "ip:(%u,%u)", indexPath.section, indexPath.row)
        allHeight[key] = 200
        tableView.endUpdates()
    }
    
}
