//
//  WelcomePhotoTableViewCell.swift
//  organize30
//
//  Created by Bruno Raphael Castilho de Freitas on 22/02/2019.
//  Copyright © 2019 Bruno Raphael. All rights reserved.
//

import UIKit

class WelcomePhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var profilePhotoManager = ProfilePhotoManager()
    var numberOfImages:Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier:"s")
        self.profilePhotoManager.output = self
        self.profilePhotoManager.numberOfImages()
    }
}

extension WelcomePhotoTableViewCell:ProfilePhotoManagerOutput {
    
    func fetchedNumber(of images: Int) {
        self.numberOfImages = images
        self.collectionView.reloadData()
    }
}

extension WelcomePhotoTableViewCell:UICollectionViewDelegate {}

extension WelcomePhotoTableViewCell:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return self.numberOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"s", for: indexPath) as! PhotoCollectionViewCell
        
      //  cell.backgroundColor = UIColor.green
        return cell
    }
}

extension WelcomePhotoTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width:84, height:84)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}

