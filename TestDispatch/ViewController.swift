//
//  ViewController.swift
//  TestDispatch
//
//  Created by 劉戰軍 on 2019/3/27.
//  Copyright © 2019年 liuzhanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        test()
        
        let btn = UIButton(frame: CGRect.init(x: 100, y: 100, width: 100, height: 50))
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        view.addSubview(btn)
        
    }
    
    @objc func didClickButton() {
        self.navigationController?.pushViewController(TestVC(), animated: true)
    }
    
    func test() {
        for i in 0..<50 {
            testPrint(index: i)
            DispatchQueue.global().async {
                debugPrint("async 02 - \(i)")
            }
        }
    }
    
    func testPrint(index: Int) {
        DispatchQueue.main.async {
            debugPrint("async 01 - \(index)")
        }
        debugPrint("03 主线程 - 等待开启")
    }
    

}

