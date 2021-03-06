
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
        
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let section = sections[indexPath.section]
        
        (section as? TableSectionCellInput)?.willDisplayCell(cell, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return  UITableView.automaticDimension}
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat { return UITableView.automaticDimension}
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let section = sections[section]
        
        (section as? TableSectionCellInput)?.willDisplayHeaderView?(view: view)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        guard let height = (sections[section] as? TableSectionCellInput)?.heightForHeaderInSection?() else { return .leastNonzeroMagnitude }
        
        return height
    }
    
}


//MARK: - SectionOutput
extension TableViewController:SectionOutput {
    
    func removeItem(from index: Int, in section: Section, animation:UITableView.RowAnimation, completion: (() -> Void)?) {
        
        self.runPerformBatchUpdates({
            self.remove(from:index, in:section, with:animation)
        }, completion: {
            completion?()
        })
    }
    
    func endRefreshing(error: String?) {}
    
    func reloadSection(section: Section, animation:UITableView.RowAnimation) {
        
        self.reload(with: section, and: animation)
        
    }
}

//MARK: - Helpers
extension TableViewController {
    
    private func runPerformBatchUpdates(_ block: @escaping ()->(), completion:@escaping ()->Void) {
        
        executeOnMainQueue {
            
            if #available(iOS 11.0, *) {
                
                self.tableView.performBatchUpdates({
                    
                    block()
                    
                }, completion: { (_) in
                    
                    completion()
                    
                })
                
            } else {
                
                CATransaction.begin()
                
                self.tableView.beginUpdates()
                
                CATransaction.setCompletionBlock { () -> Void in
                    
                    completion()
                }
                
                block()
                
                self.tableView.endUpdates()
                
                CATransaction.commit()
            }
        }
    }
    
    private func remove(from index: Int, in section:Section, with animation:UITableView.RowAnimation) {
        
        if let sectionIndex = self.sections.index(of:section), section.items.count > index {
            section.items.remove(at:index)
            let changed = [IndexPath.init(item:index, section:sectionIndex)]
            self.tableView.deleteRows(at:changed, with:animation)
        }
    }
    
    private func reload(with section:Section, and animation:UITableView.RowAnimation) {
        
        guard let sectionIndex = self.sections.lastIndex(of:section) else {
            return
        }
        
        
        executeOnMainQueue {
            self.tableView.reloadSections(IndexSet.init(integer:sectionIndex), with: animation)
            self.reloadWithoutAnimation()
        }
    }
    
    private func reloadWithoutAnimation() {
        let lastScrollOffset = self.tableView.contentOffset
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        self.tableView.layer.removeAllAnimations()
        self.tableView.setContentOffset(lastScrollOffset, animated: false)
    }
}




