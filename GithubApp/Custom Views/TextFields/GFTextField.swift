//
//  GFTextField.swift
//  GithubApp
//
//  Created by Adam on 11/16/20.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) { //the storyboard initializer default
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
       translatesAutoresizingMaskIntoConstraints = false
       
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground // check sementic colors to see the difference
        autocorrectionType = .no
        keyboardType = .default
        returnKeyType = .go
        placeholder = "Enter a username"
    }

}
