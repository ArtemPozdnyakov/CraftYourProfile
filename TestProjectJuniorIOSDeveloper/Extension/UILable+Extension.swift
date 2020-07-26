//
//  UILable+Extension.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by admin on 7/2/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(text: String?, numberLines: Int, textColor: UIColor, font: UIFont? = .sfCompactRounded26(), alignment: NSTextAlignment) {
        self.init()
        
        self.text = text
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberLines
        self.textAlignment = alignment
    }
}
