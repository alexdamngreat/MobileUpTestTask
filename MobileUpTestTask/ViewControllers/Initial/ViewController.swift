//
//  ViewController.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 21.07.2021.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel! 
  @IBOutlet weak var loginButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

    titleLabel.frame = CGRect(x: 0, y: 0, width: 327, height: 120)
    titleLabel.backgroundColor = .clear
    titleLabel.textColor = UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1)
    titleLabel.font = UIFont(name: "SFProDisplay-Bold", size: 48)
    titleLabel.numberOfLines = 2
    titleLabel.lineBreakMode = .byWordWrapping
    titleLabel.text = "Mobile Up\nGallery"
    
    loginButton.setTitle("Вход через VK", for: .normal)
    loginButton.frame = CGRect(x: 0, y: 0, width: 327, height: 56)
    loginButton.backgroundColor = .white
    loginButton.layer.backgroundColor = UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1).cgColor
    loginButton.layer.cornerRadius = 8
    loginButton.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 18)
    loginButton.titleLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
  }
}



