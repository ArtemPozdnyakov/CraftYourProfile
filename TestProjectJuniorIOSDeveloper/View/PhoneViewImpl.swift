//
//  PhoneViewImpl.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by admin on 7/4/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit
import PinLayout
import PhoneNumberKit

protocol PhoneViewProtocol: UIView {
    var clouseButton: UIButton { get }
    var nextButton: UIButton { get }
    var codeButton: UIButton { get set }
    var phoneTextField: PhoneNumberTextField { get set }
}

class PhoneViewImpl: UIView, PhoneViewProtocol {
    
    internal var clouseButton: UIButton = {
        $0.setImage(UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.9582243562, green: 0.9509575963, blue: 0.9842651486, alpha: 1)
        $0.tintColor = #colorLiteral(red: 0.6851776242, green: 0.7179468274, blue: 0.7610188127, alpha: 1)
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton(type: .system))
    
    private let letsVerifyLabel = UILabel(text: "Let's varify your phone number 😘",
                                          numberLines: 0,
                                          textColor: #colorLiteral(red: 0.2110047936, green: 0.2157777548, blue: 0.2200372517, alpha: 1),
                                          font: .sfCompactRounded33(),
                                          alignment: .left)
    
    private let phoneNumberLabel = UILabel(text: "PHONE NUMBER",
                                           numberLines: 0,
                                           textColor: #colorLiteral(red: 0.5071314573, green: 0.5494142175, blue: 0.6010261178, alpha: 1),
                                           font: .sfCompactRounded16(),
                                           alignment: .left)
    
    internal let nextButton = UIButton(text: "Next",
                              tintColor: .white,
                              cornerRadius: 23,
                              backgroundColor: #colorLiteral(red: 0.1580005288, green: 0.7216834426, blue: 1, alpha: 1),
                              font: .sfCompactRounded20())
    private let numberPhoneView = UIView()
    
    internal var codeButton = UIButton(text: "+999",
                              tintColor: #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1),
                              cornerRadius: 0,
                              backgroundColor: #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1),
                              font: .sfCompactRounded20(),
                              textAlignmemt: .center)
    
    internal var phoneTextField: PhoneNumberTextField = {
        $0.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        $0.keyboardType = .phonePad
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        $0.font = .sfCompactRounded20()
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: $0.frame.height))
        $0.leftViewMode = .always
        $0.withExamplePlaceholder = false
        $0.withPrefix = false
        return $0
    }(PhoneNumberTextField())
    
    //MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        initViews()
        nextButton.castomizeButton(image: UIImage(named: "arrow")!,
                                         constant: -20,
                                         width: 20,
                                         height: 20)
        start()
    }
    
    func initViews() {
        backgroundColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998808503, alpha: 1)
        nextButton.alpha = 0.0
        
        clouseButton.pin(to: self).top().marginTop(65).left().marginLeft(15).width(45).height(45)
        letsVerifyLabel.pin(to: self).below(of: clouseButton).marginTop(18).left(27).width(300).height(100)
        phoneNumberLabel.pin(to: self).below(of: letsVerifyLabel).marginTop(10).left(27).width(150).height(30)

        numberPhoneView.pin(to: self).below(of: phoneNumberLabel).marginTop(10).horizontally(27).height(50)
        
        nextButton.pin(to: self).below(of: numberPhoneView).marginTop(185).horizontally(27).height(53)
    }
    
    func start() {
        numberPhoneView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        numberPhoneView.layer.cornerRadius = 18
        
        codeButton.castomizeButton(image: (UIImage(systemName: "chevron.down",
                                                         withConfiguration: UIImage.SymbolConfiguration(weight: .black))?.withTintColor(#colorLiteral(red: 0.6773341298, green: 0.7101025581, blue: 0.7531747818, alpha: 1), renderingMode: .alwaysOriginal))!,
                                         constant: -10,
                                         width: 20,
                                         height: 20)
        
        codeButton.pin(to: numberPhoneView).top().bottom().left().margin(0).width(118).height(numberPhoneView.frame.height)
        phoneTextField.pin(to: numberPhoneView).after(of: codeButton, aligned: .center).margin(0.5).height(numberPhoneView.bounds.height).width(250)
        
        codeButton.roundCorners(corners: [.topLeft, .bottomLeft], radius: 16)
        phoneTextField.roundCorners(corners: [.topRight, .bottomRight], radius: 16)
    }
}

