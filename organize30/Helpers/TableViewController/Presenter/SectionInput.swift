//
//  TableViewSectionInput.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 15/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

@objc protocol SectionInput: class { }


@objc protocol SectionStateInput: SectionInput {
    
    @objc optional func viewDidLoad()
    
    @objc optional func viewWillAppear()
    
    @objc optional func viewWillDisappear()
    
}

@objc protocol TableSectionCellInput: SectionInput {
   
    @objc func cell(for indexPath: IndexPath) -> UITableViewCell.Type
    @objc func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath)
    @objc optional func rowIsVisible(with indexPath:IndexPath)->Bool
    @objc func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath)
}
