//
//  AuthorizationViewController.swift
//  MobileUpTestTask
//
//  Created by Александр Тимофеев on 22.07.2021.
//

import UIKit
import WebKit
import SwiftKeychainWrapper

class AuthorizationViewController: UIViewController, WKNavigationDelegate {
  
  @IBOutlet weak var webview: WKWebView! {
    didSet {
      webview.navigationDelegate = self
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let token = KeychainWrapper.standard.string(forKey: "MobileUpToken"){
      Session.shared.token = token
      login()
      return
    }
    authorizationVK()
  }
  
  private func authorizationVK() {
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "oauth.vk.com"
    urlComponents.path = "/authorize"
    urlComponents.queryItems = [
      URLQueryItem(name: "client_id", value: "7908727"),
      URLQueryItem(name: "display", value: "mobile"),
      URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
      URLQueryItem(name: "scope", value: "262150"),
      URLQueryItem(name: "response_type", value: "token"),
      URLQueryItem(name: "v", value: "5.131")
    ]
  
    let request = URLRequest(url: urlComponents.url!)
  
    webview.load(request)
  }
  
  public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
    guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
      decisionHandler(.allow)
      return
    }
  
    let params = fragment
        .components(separatedBy: "&")
        .map { $0.components(separatedBy: "=") }
        .reduce([String: String]()) { result, param in
          var dict = result
          let key = param[0]
          let value = param[1]
          dict[key] = value
          return dict
      }
  
    if let token = params["access_token"] {
      KeychainWrapper.standard.set(token,forKey: "MobileUpToken")
      Session.shared.token = token
      login()
    }
    decisionHandler(.cancel)
  }
  
  func login() {
    performSegue(withIdentifier: "loginSegue", sender: nil)
  }
}


