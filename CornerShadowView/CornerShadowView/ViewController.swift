//
//  ViewController.swift
//  CornerShadowView
//
//  Created by WillowRivers on 2020/12/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var datasource = [1, 2, 3, 4]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView = UITableView(frame: self.view.bounds)
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AnyCell.classForCoder(), forCellReuseIdentifier: AnyCell.cellReuseIdentifier())
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AnyCell.cellHeight()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AnyCell = tableView.dequeueReusableCell(withIdentifier: AnyCell.cellReuseIdentifier()) as! AnyCell
        cell.updateContent(model: nil)
        return cell
    }
    
    
    
    


}

