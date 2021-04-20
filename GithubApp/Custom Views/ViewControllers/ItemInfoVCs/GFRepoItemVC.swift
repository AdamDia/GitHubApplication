//
//  GFRepoItemVC.swift
//  GithubApp
//
//  Created by Adam on 12/9/20.
//

import Foundation


class GFRepoItemVC: GFItemInfoVC {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItem()
    }
    
    private func configureItem() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }

}
