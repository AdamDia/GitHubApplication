//
//  UIViewController+Ex.swift
//  GithubApp
//
//  Created by Adam on 11/16/20.
//

import UIKit


extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async { //no need for [weak self here] not causing a retain cycle
            let alertVC = GFAlertVc(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve // animation
            self.present(alertVC, animated: true)
        }
    }
}
