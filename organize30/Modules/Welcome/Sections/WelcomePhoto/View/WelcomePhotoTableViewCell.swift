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
    
    var numberOfImages:Int = 0
    let interactor:ProfileImageHelperInteractor = ProfileImageHelperInteractor.init()
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
//        self.collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier:"s")
        collectionView.register(UINib(nibName:"PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"s")
        self.interactor.output = self
        self.interactor.imagesCount()
        
    }
}

extension WelcomePhotoTableViewCell : ProfileImageHelperInteractorOutput {
    
    func number(images: Int) {
        
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
        
        self.interactor.imageNameIn(index: indexPath.row) { (name) in
            cell.setup(fileName: name)
        }
        
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
