//
//  ViewController.swift
//  ResizingTableSectionHeader
//
//  Created by Brad Leege on 6/9/21.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.register(UINib(nibName: "BasicCell", bundle: .none), forCellReuseIdentifier: "basicCellId")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sectionHeader: UIView = {
        let vc = DynamicHeightSectionHeader()
        return vc.view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Resizing Section Header"
        
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "basicCellId", for: indexPath) as? BasicCell else {
            return UITableViewCell()
        }
        
        cell.cellNumberLabel.text = String(indexPath.row)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        print("sectionHeader Height = \(sectionHeader.bounds.height); Width = \(sectionHeader.bounds.width)")
        return sectionHeader.bounds.height
    }
    
}
