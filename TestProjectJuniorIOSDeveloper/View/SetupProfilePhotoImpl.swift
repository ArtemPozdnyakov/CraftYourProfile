//
//  SetupProfilePhoto.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by Artem Pozdnyakov on 7/22/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit
import PinLayout

protocol SetupProfilePhotoProtocol: UIView {
    var backButton: UIButton { get }
    var photoView: UIImageView { get set }
    var editButton: UIButton { get }
    var addDoneButton: UIButton { get }
}

class SetupProfilePhotoImpl: UIView, SetupProfilePhotoProtocol {
    
    internal var backButton: UIButton = {
        $0.setImage(UIImage(systemName: "arrow.left", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.9582243562, green: 0.9509575963, blue: 0.9842651486, alpha: 1)
        $0.tintColor = #colorLiteral(red: 0.6851776242, green: 0.7179468274, blue: 0.7610188127, alpha: 1)
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton(type: .system))
    
    private let addPhotoLabel = UILabel(text: "Add profile photo ❤️",
                                        numberLines: 0,
                                        textColor: #colorLiteral(red: 0.2110047936, green: 0.2157777548, blue: 0.2200372517, alpha: 1),
                                        font: .sfCompactRounded30(),
                                        alignment: .left)
    
    internal var photoView: UIImageView = {
        $0.backgroundColor = #colorLiteral(red: 0.9582243562, green: 0.9509575963, blue: 0.9842651486, alpha: 1)
        $0.image = #imageLiteral(resourceName: "рожи-2")
        $0.layer.cornerRadius = 85
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    internal var editButton: UIButton = {
        $0.setTitle("Edit", for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
        $0.titleLabel?.font = .sfCompactRounded16()
        return $0
    }(UIButton(type: .system))
    
    private let skipLable = UILabel(text: "Skip for now",
                                    numberLines: 0,
                                    textColor: #colorLiteral(red: 0.6851776242, green: 0.7179468274, blue: 0.7610188127, alpha: 1),
                                    font: .sfCompactRounded16(),
                                    alignment: .center)
    
    internal var addDoneButton = UIButton(text: "Add Photo",
                                          tintColor: .white,
                                          cornerRadius: 23,
                                          backgroundColor: #colorLiteral(red: 0.1580005288, green: 0.7216834426, blue: 1, alpha: 1),
                                          font: .sfCompactRounded20())
    
    
//MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        editButton.isHidden = true
        initViews()
    }
    
    func initViews() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        backButton.pin(to: self).top(65).left(15).width(45).height(45)
        addPhotoLabel.pin(to: self).below(of: backButton).marginTop(13).left(25).width(300).height(50)
        photoView.pin(to: self).hCenter().vCenter().width(200).height(200)
        editButton.pin(to: self).below(of: photoView, aligned: .center).marginTop(-50).width(60).height(35)
        skipLable.pin(to: self).bottom().marginBottom(150).hCenter().width(100).height(30)
        addDoneButton.pin(to: self).below(of: skipLable).margin(15).horizontally(24).height(50)
    }
}
