//
//  GalleryViewController.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 22.07.2021.
//

import UIKit
import Kingfisher

class GalleryViewController: ViewController {
  //var images = [Photo]()
  // var photoArray = PhotoDataStorage.shared.photos
  var photoArray = [Photo]()
  let apiService = APIVkontakte()
  let countCells = 2
  let indent: CGFloat = 2.0
  let cellID = "cell"
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellID)
    
    DispatchQueue.main.async {
      self.apiService.getGroupPhotos { [weak self] photos in
        guard let self = self else { return }
        self.photoArray = photos
        self.collectionView.reloadData()
      }
    }
  }
}

extension GalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    photoArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
    let strUrl = URL(string: photoArray[indexPath.item].sizes.last!.url)
    DispatchQueue.main.async {
      cell.configure(url: strUrl!)
    }
    return cell
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let frame = collectionView.frame
    let widthCell = frame.width / CGFloat(countCells)
    let heightCell = widthCell
    let spacing = CGFloat(countCells + 1) * indent / CGFloat(countCells)
    
    return CGSize(width: widthCell - spacing, height: heightCell - (indent * 2))
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    print("Tap tap tap\(indexPath)")
    DispatchQueue.main.async {
      guard let vc = self.storyboard?.instantiateViewController(identifier: "FullScreenViewController") as? FullScreenViewController else { return }
      vc.photoArray = self.photoArray
      vc.indexPath = indexPath
      self.navigationController?.pushViewController(vc, animated: true)
    }
  }
}
