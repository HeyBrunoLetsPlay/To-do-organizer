//
//  WelcomePhotoSection.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 22/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

class WelcomePhotoSection:Section {
    
    init(with builder:WelcomeHeaderDisplayItemBuilder) {
        super.init()
        self.items = [builder.make()]
    }
}

extension WelcomePhotoSection:TableSectionCellInput {
    func cell(for indexPath: IndexPath) -> UITableViewCell.Type {
        return WelcomePhotoTableViewCell.self
    }
    
    func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        
    }
    
    func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath) {}
}
