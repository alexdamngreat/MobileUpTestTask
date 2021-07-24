//
//  CollectionViewCell.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 22.07.2021.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
  var savePhoto: UIImage?
  
  @IBOutlet weak var photoVIew: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }
  
  func configure(url: URL) {
    photoVIew.kf.indicatorType = .activity
    photoVIew.kf.setImage(with: url)
    
    savePhoto = photoVIew.image
  }
}
