//
//  GalleryViewController.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 22.07.2021.
//

import UIKit

class GalleryViewController: ViewController {
  
  var images = [#imageLiteral(resourceName: "photo_2017-06-22_21-33-16"), #imageLiteral(resourceName: "photo_2017-06-22_21-33-16"), #imageLiteral(resourceName: "photo_2017-06-22_21-33-16"), #imageLiteral(resourceName: "photo_2017-06-22_21-33-16")]
  let countCells = 2
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
  }
}

extension GalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    images.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
    cell.photoVIew.image = images[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let frame = collectionView.frame
    let widthCell = frame.width / CGFloat(countCells)
    let heightCell = widthCell
    
    return CGSize(width: widthCell, height: heightCell)
  }
  
}
