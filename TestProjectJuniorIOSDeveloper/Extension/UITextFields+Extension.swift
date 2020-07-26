//
//  UITextFields+Extension.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by admin on 7/5/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit

extension UITextField {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func castomizeTextField(image: UIImage, constant: CGFloat, width: CGFloat, height: CGFloat) {
        let setupImage = UIImageView(image: image, contentMode: .scaleAspectFit)
        setupImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(setupImage)
        
        setupImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constant).isActive = true
        setupImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        setupImage.widthAnchor.constraint(equalToConstant: width).isActive = true
        setupImage.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
