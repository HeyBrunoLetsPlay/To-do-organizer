//
//  TableViewSectionOutput.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 15/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import Foundation

protocol SectionOutput:class  {
    func endRefreshing(error: String?)
    func reloadSection(section: Section, completion: (() -> Void)?)
    func updateItemsSection(section: Section, completion: (() -> Void)?)
}
