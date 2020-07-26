//
//  UIImageView+Extension.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by admin on 7/2/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIImageView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}
