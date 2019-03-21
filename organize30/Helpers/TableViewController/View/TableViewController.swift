
//  TableViewController.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 15/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

//MARK: - Life Cycle
class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections: [Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.setupSectionsOutput()
        sections.forEach({($0 as? SectionStateInput)?.viewDidLoad?()})
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sections.forEach({ ($0 as? SectionStateInput)?.viewWillAppear?() })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sections.forEach({ ($0 as? SectionStateInput)?.viewWillDisappear?() })
    }
    
    private func setupSectionsOutput() {
        sections.forEach({ $0.output = self })
    }
    
    private func registerCell(_ section: Section, at indexPath: IndexPath) {
        let cellClass = (section as? TableSectionCellInput)?.cell(for: indexPath) ?? UITableViewCell.self
        let nib = UINib(nibName: cellClass.defaultReuseIdentifier, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier:cellClass.defaultReuseIdentifier)
    }
}

//MARK: - UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        
        (sections[indexPath.section] as? TableSectionCellInput)?.didSelectCell(cell, at: indexPath)
    }
}

//MARK: - UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  (self.sections[section]).items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let identifier = (section as? TableSectionCellInput)?.cell(for: indexPath).defaultReuseIdentifier ?? UITableViewCell.defaultReuseIdentifier
        registerCell(section, at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier:identifier, for:indexPath)
        
        (section as? TableSectionCellInput)?.willDisplayCell(cell, at: indexPath)
        
        cell.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let isVisible =  (sections[indexPath.section] as? TableSectionCellInput)?.rowIsVisible?(with:indexPath) else {
            return UITableView.automaticDimension
        }
        
        return isVisible ? UITableView.automaticDimension : 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let isVisible =  (sections[indexPath.section] as? TableSectionCellInput)?.rowIsVisible?(with:indexPath) else {
            return UITableView.automaticDimension
        }
        
        return isVisible ? UITableView.automaticDimension : 0
    }
}


//MARK: - SectionOutput
extension TableViewController:SectionOutput {
    
    func endRefreshing(error: String?) {}
    
    func reloadSection(section: Section, completion: (() -> Void)?) {}
    
    func updateItemsSection(section: Section, completion: (() -> Void)?) {}
}
