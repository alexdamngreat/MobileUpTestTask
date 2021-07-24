//
//  FullScreenCollectionViewCell.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 23.07.2021.
//

import UIKit

class FullScreenCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {
  
  @IBOutlet weak var fullScreenPhoto: UIImageView!
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.scrollView.delegate = self
    self.scrollView.minimumZoomScale = 1.0
    self.scrollView.maximumZoomScale = 3.0
  }
  
  func configure(url: URL) {
    fullScreenPhoto.kf.indicatorType = .activity
    fullScreenPhoto.kf.setImage(with: url)
  }
  
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return fullScreenPhoto
  }
  
  func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
    scrollView.zoomScale = 1.0
  }
}
