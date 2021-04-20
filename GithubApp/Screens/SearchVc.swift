//
//  SearchVc.swift
//  GithubApp
//
//  Created by Adam on 11/16/20.
//

import UIKit

class SearchVc: UIViewController {

    let logoImageview = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // the color is going to adapt if dark or white
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - setup logic
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
   @objc func pushFollowerListVc() {
    guard isUsernameEntered else { 
        presentGFAlertOnMainThread(title: "Empty username", message: "please enter a username, We need to know who to look for 😄", buttonTitle: "Ok") //command + control + space to open emoji list
        return
        
    }
        let followerListVc      = FollowerListVc()
        followerListVc.username = usernameTextField.text
        followerListVc.title    = usernameTextField.text
        navigationController?.pushViewController(followerListVc, animated: true)
    }
    
    //MARK: - setup UI Constraints
    func configureLogoImageView() {
        view.addSubview(logoImageview) //like how to make outlet from the storyboard
        logoImageview.translatesAutoresizingMaskIntoConstraints = false
        logoImageview.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageview.heightAnchor.constraint(equalToConstant: 200),
            logoImageview.widthAnchor.constraint(equalToConstant: 200)
        
        ])
    }
    
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageview.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVc), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }

}


extension SearchVc: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVc()
        return true
    }
}
