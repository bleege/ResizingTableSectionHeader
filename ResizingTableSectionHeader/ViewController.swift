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
    
    let sectionHeader = DynamicHeightSectionHeader()
    var sectionHeaderView: UIView {
        return sectionHeader.view
    }
        
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

    func toggleHeader() {

        if sectionHeader.headerHeightConstraint.constant == sectionHeader.collapseHeight {
            expandSectionHeader()
        } else {
            collapseSectionHeader()
        }
        
    }
    
    func expandSectionHeader() {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.sectionHeader.headerHeightConstraint.constant = self.sectionHeader.expandedHeight
            self.view.layoutIfNeeded()
        })
        
    }
    
    func collapseSectionHeader() {
        UIView.animate(withDuration: 0.5, animations: {
            self.sectionHeader.headerHeightConstraint.constant = self.sectionHeader.collapseHeight
            self.view.layoutIfNeeded()
        })
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
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        print("sectionHeader Height = \(sectionHeaderView.bounds.height); Width = \(sectionHeaderView.bounds.width)")
        return sectionHeaderView.bounds.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt = \(indexPath.row)")
        toggleHeader()
    }
    
}
