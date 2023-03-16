//
//  ContainerViewController.swift
//  Demo
//
//  Created by Khayala Hasanli on 16.03.23.
//

import UIKit

class ContainerViewController: UINavigationController {
    
    private var sideMenuIsOpen = false
    
    private let animationDuration: TimeInterval = 0.5
    private let sideMenuViewController = SideMenuViewController()
    private let mainViewController = ViewController()
    
    private let sideMenuWidth: CGFloat = 300
    private var trailingConstraint : NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        navigationBar.isHidden = true
        
        addChild(mainViewController)
        addChild(sideMenuViewController)
        view.addSubview(sideMenuViewController.view)
        view.addSubview(mainViewController.view)
        
        mainViewController.sideButton.addTarget(self, action: #selector(toggleSideMenu), for: .touchUpInside)
        mainViewController.view.translatesAutoresizingMaskIntoConstraints = false
        sideMenuViewController.view.translatesAutoresizingMaskIntoConstraints = false

        sideMenuViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        sideMenuViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        sideMenuViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingConstraint = sideMenuViewController.view.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        trailingConstraint?.isActive = true
        
        mainViewController.view.leadingAnchor.constraint(equalTo: sideMenuViewController.view.trailingAnchor).isActive = true
        mainViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc func toggleSideMenu() {
        sideMenuIsOpen.toggle()
        let width = sideMenuIsOpen ? sideMenuWidth : 0
        
        trailingConstraint?.constant = width
        
        UIView.animate(withDuration: animationDuration) {
            self.view.layoutIfNeeded()
        }

    }
}
