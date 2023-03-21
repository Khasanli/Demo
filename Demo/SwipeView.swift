//
//  SwipeView.swift
//  Demo
//
//  Created by Khayala Hasanli on 21.03.23.
//

import UIKit

class SwipeView : UIView {
    
    private let segmentedControl = UISegmentedControl(items: ["On", "Off"])
    private let tappedControl = UIControl()
    private var tappedControlLeadingConstraint: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    private func setView(){
        addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        segmentedControl.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        segmentedControl.addTarget(self, action: #selector(onValueChanged), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        
        addSubview(tappedControl)
        tappedControl.translatesAutoresizingMaskIntoConstraints = false
        tappedControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tappedControl.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        tappedControl.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        tappedControl.addTarget(self, action: #selector(controlTapped), for: .touchUpInside)
        tappedControlLeadingConstraint = tappedControl.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor)
        tappedControlLeadingConstraint.isActive = true
    }
    
    @objc private func onValueChanged(){
        if segmentedControl.selectedSegmentIndex == 0 {
            tappedControlLeadingConstraint.constant = 0
            tappedControlLeadingConstraint.isActive = true
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        } else {
            tappedControlLeadingConstraint.constant = frame.width/2
            tappedControlLeadingConstraint.isActive = true
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }
    }
    
    @objc private func controlTapped(){
        print("Control Tapped")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
