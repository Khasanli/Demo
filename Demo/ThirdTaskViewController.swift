//
//  ThirdTaskViewController.swift
//  Demo
//
//  Created by Khayala Hasanli on 21.03.23.
//

import UIKit

class ThirdTaskViewController : UIViewController {
        
    private let swipeView = SwipeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(swipeView)
        swipeView.translatesAutoresizingMaskIntoConstraints = false
        swipeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        swipeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        swipeView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        swipeView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

}
