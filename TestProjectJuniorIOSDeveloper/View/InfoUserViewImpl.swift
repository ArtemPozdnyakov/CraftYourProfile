//
//  InfoUserImpl.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by Artem Pozdnyakov on 7/19/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit
import PinLayout

protocol InfoUserViewProtocol: UIView {
    var backButton: UIButton { get }
    var nameTextField: UITextField { get }
    var dateBirthdayTextField: UITextField { get set }
    var datePickerView: UIDatePicker { get set }
    var nextButton: UIButton { get }
}

class InfoUserViewImpl: UIView, InfoUserViewProtocol {
    
    internal var backButton: UIButton = {
        $0.setImage(UIImage(systemName: "arrow.left", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.9582243562, green: 0.9509575963, blue: 0.9842651486, alpha: 1)
        $0.tintColor = #colorLiteral(red: 0.6851776242, green: 0.7179468274, blue: 0.7610188127, alpha: 1)
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton(type: .system))
    
    private let introduceYourselfLabel = UILabel(text: "Let's introduce yourself 🤪",
                                                 numberLines: 0,
                                                 textColor: #colorLiteral(red: 0.2110047936, green: 0.2157777548, blue: 0.2200372517, alpha: 1),
                                                 font: .sfCompactRounded33(),
                                                 alignment: .left)
    
    private let nameLabel = UILabel(text: "NAME",
                                    numberLines: 0,
                                    textColor: #colorLiteral(red: 0.5071314573, green: 0.5494142175, blue: 0.6010261178, alpha: 1),
                                    font: .sfCompactRounded16(),
                                    alignment: .left)
    
    internal var nameTextField: UITextField = {
        $0.layer.cornerRadius = 17
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        $0.textAlignment = .center
        $0.font = .sfCompactRounded20()
        return $0
    }(UITextField())
    
    private let birthdayLabel = UILabel(text: "BIRTHDAY",
                                        numberLines: 0,
                                        textColor: #colorLiteral(red: 0.5071314573, green: 0.5494142175, blue: 0.6010261178, alpha: 1),
                                        font: .sfCompactRounded16(),
                                        alignment: .left)
    
    internal var dateBirthdayTextField: UITextField = {
        $0.layer.cornerRadius = 17
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        $0.textAlignment = .center
        $0.font = .sfCompactRounded20()
        return $0
    }(UITextField())
    
    internal var nextButton = UIButton(text: "NEXT",
                                      tintColor: .white,
                                      cornerRadius: 23,
                                      backgroundColor: #colorLiteral(red: 0.1580005288, green: 0.7216834426, blue: 1, alpha: 1),
                                      font: .sfCompactRounded20())
    
    internal var datePickerView: UIDatePicker = {
        $0.datePickerMode = .date
        $0.maximumDate = Date()
        $0.isHidden = true
        return $0
    }(UIDatePicker())
    
    //MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        initViews()
        nextButton.castomizeButton(image: UIImage(named: "arrow")!,
                                   constant: -20,
                                   width: 20,
                                   height: 20)
        
        dateBirthdayTextField.castomizeTextField(image: (UIImage(systemName: "chevron.down",
                                                                 withConfiguration: UIImage.SymbolConfiguration(weight: .black))?.withTintColor(#colorLiteral(red: 0.6773341298, green: 0.7101025581, blue: 0.7531747818, alpha: 1), renderingMode: .alwaysOriginal))!,
                                                 constant: -10,
                                                 width: 20,
                                                 height: 20)
    }
    
    func initViews() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        backButton.pin(to: self).top().marginTop(65).left().marginLeft(15).width(45).height(45)
        introduceYourselfLabel.pin(to: self).below(of: backButton).marginTop(18).left(25).width(300).height(100)
        nameLabel.pin(to: self).below(of: introduceYourselfLabel).marginTop(10).left(25).width(150).height(30)
        nameTextField.pin(to: self).below(of: nameLabel).marginTop(10).horizontally(24).height(50)
        birthdayLabel.pin(to: self).below(of: nameTextField).marginTop(20).left(25).width(100).height(30)
        dateBirthdayTextField.pin(to: self).below(of: birthdayLabel).marginTop(10).horizontally(24).height(50)
        nextButton.pin(to: self).below(of: dateBirthdayTextField).marginTop(50).horizontally(24).height(53)
        datePickerView.pin(to: self).bottom().marginBottom(10).horizontally().height(250)
    }
}
