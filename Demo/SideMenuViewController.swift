//
//  SideMenuViewController.swift
//  Demo
//
//  Created by Khayala Hasanli on 16.03.23.
//

import UIKit

class SideMenuViewController: UIViewController {
            
    private let homeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle("Home", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let settingButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle("Setting", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let profileButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle("Profile", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView(){
        view.backgroundColor = .brown

        view.addSubview(homeButton)
        homeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        homeButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        homeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(settingButton)
        settingButton.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 20).isActive = true
        settingButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        settingButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        settingButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        view.addSubview(profileButton)
        profileButton.topAnchor.constraint(equalTo: settingButton.bottomAnchor, constant: 20).isActive = true
        profileButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        profileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
