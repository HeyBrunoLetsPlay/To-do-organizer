//
//  PhotoCollectionViewCell.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 04/03/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
       
    }
    
    
    func setup(fileName:String) {
    
        self.imageView.image = UIImage.init(named: fileName)
        
    }
}
