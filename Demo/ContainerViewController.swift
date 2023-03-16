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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        navigationBar.isHidden = true
        
        addChild(mainViewController)
        addChild(sideMenuViewController)
        view.addSubview(sideMenuViewController.view)
        view.addSubview(mainViewController.view)
        
        mainViewController.sideButton.addTarget(self, action: #selector(toggleSideMenu), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainViewController.view.frame = CGRect(x: sideMenuIsOpen ? sideMenuWidth : 0, y: 0, width: view.frame.width - (sideMenuIsOpen ? sideMenuWidth : 0), height: view.frame.height)
        sideMenuViewController.view.frame = CGRect(x: sideMenuIsOpen ? 0 : -sideMenuWidth, y: 0, width: sideMenuWidth, height: view.frame.height)
    }
    
    @objc func toggleSideMenu() {
        sideMenuIsOpen.toggle()
        let width = sideMenuIsOpen ? sideMenuWidth : 0
        
        UIView.animate(withDuration: animationDuration) {
            self.mainViewController.view.frame = CGRect(x: width, y: 0, width: self.view.frame.width - width, height: self.view.frame.height)
            self.sideMenuViewController.view.frame = CGRect(x: self.sideMenuIsOpen ? 0 : -self.sideMenuWidth, y: 0, width: self.sideMenuWidth, height: self.view.frame.height)
            self.view.layoutIfNeeded()
        }
    }
}
