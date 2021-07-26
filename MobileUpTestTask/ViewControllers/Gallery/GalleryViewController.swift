//
//  GalleryViewController.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 22.07.2021.
//

import UIKit
import Kingfisher

class GalleryViewController: UIViewController {
  var photoArray = [Photo]()
  var tokenError = 0
  let apiService = APIVkontakte()
  let countCells = 2
  let indent: CGFloat = 2.0
  let cellID = "cell"
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBAction func logout(_ sender: UIButton) {
    performSegue(withIdentifier: "logoutSegue", sender: nil)
  }
    
  override func viewDidLoad() {
   
    DispatchQueue.main.async {
      
      self.apiService.getGroupPhotos { [weak self] photos in
        guard let self = self else { return }
        self.photoArray = photos
        self.collectionView.reloadData()

//        let vc = ViewController()
//    
//        UIApplication.shared.windows.first?.rootViewController = vc
      }
    }
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(UINib(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellID)
    setupUI()
  }
  
  func setupUI() {
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Semibold", size: 18) ?? UIFont.systemFont(ofSize: 18)]
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
    
      guard let vc = self.storyboard?.instantiateViewController(identifier: "FullScreenViewController") as? FullScreenViewController else { return }
      vc.photoArray = self.photoArray
      vc.indexPath = indexPath
      self.navigationController?.pushViewController(vc, animated: true)
  }
}
