//
//  TableViewSectionOutput.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 15/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation
import UIKit

protocol SectionOutput:class  {
    func endRefreshing(error: String?)
    func reloadSection(section: Section, animation:UITableView.RowAnimation)
    func removeItem(from index: Int, in section: Section, animation:UITableView.RowAnimation, completion: (() -> Void)?)
}
