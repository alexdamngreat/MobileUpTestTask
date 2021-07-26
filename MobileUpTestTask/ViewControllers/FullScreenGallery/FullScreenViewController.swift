//
//  FullScreenViewController.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 23.07.2021.
//

import UIKit

class FullScreenViewController: UIViewController {
  let fullScreenCellID = "fullScreenCell"
  let countOFCells = 1
  var photoArray = [Photo]()
  var indexPath: IndexPath!

  
  @IBOutlet weak var fullScreenView: UICollectionView!
  
  @IBAction func shareButton(_ sender: UIButton) {
    let items: [Any] = ["Поделиться фотографией"]
    let avc = UIActivityViewController(activityItems: items, applicationActivities: nil)
    self.present(avc, animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    fullScreenView.delegate = self
    fullScreenView.dataSource = self
    fullScreenView.register(UINib(nibName: "FullScreenCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: fullScreenCellID)
    fullScreenView.performBatchUpdates(nil) { result in
      self.fullScreenView.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)
    }
  }
}

extension FullScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photoArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fullScreenCellID, for: indexPath) as? FullScreenCollectionViewCell else { return UICollectionViewCell() }
    let strUrl = URL(string: photoArray[indexPath.item].sizes.last!.url)
    cell.configure(url: strUrl!)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let frame = fullScreenView.frame
    let widthCell = frame.width / CGFloat(countOFCells)
    let heighCell = widthCell
    
    return CGSize(width: widthCell, height: heighCell)
  }
}
