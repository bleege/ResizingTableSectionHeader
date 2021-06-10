//
//  DynamicHeightSectionHeader.swift
//  ResizingTableSectionHeader
//
//  Created by Brad Leege on 6/9/21.
//

import UIKit

class DynamicHeightSectionHeader: UIViewController {

    @IBOutlet weak var headerWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    
    let collapseHeight:CGFloat = 150
    let expandedHeight:CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("viewDidLoad's headerHeightContstraint constant = \(headerHeightConstraint.constant)")
        self.headerHeightConstraint.constant = collapseHeight
        print("viewDidLoad's updated headerHeightContstraint constant = \(headerHeightConstraint.constant)")
        
        let width = UIScreen.main.bounds.width
        print("Screen width = \(width); Stock headerWidthConstraint = \(headerWidthConstraint.constant)")
        headerWidthConstraint.constant = width
        print("New headerWidthConstraint = \(headerWidthConstraint.constant)")
        self.view.layoutIfNeeded()
    }

}
