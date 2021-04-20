//
//  FollowerListVc.swift
//  GithubApp
//
//  Created by Adam on 11/16/20.
//

import UIKit

class FollowerListVc: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    

}
