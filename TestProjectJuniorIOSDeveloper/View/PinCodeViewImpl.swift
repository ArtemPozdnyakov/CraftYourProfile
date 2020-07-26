//
//  PinCodeViewImpl.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by Artem Pozdnyakov on 7/8/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit
import PinLayout

protocol PinCodeViewProtocol: UIView {
    var backButton: UIButton { get }
    var doneButton: UIButton { get }
    var pinTextField1: UITextField { get }
    var pinTextField2: UITextField { get }
    var pinTextField3: UITextField { get }
    var pinTextField4: UITextField { get }
    var pinTextField5: UITextField { get }
    var pinTextField6: UITextField { get }
    var pinImage1: UIView { get set }
    var pinImage2: UIView { get set }
    var pinImage3: UIView { get set }
    var pinImage4: UIView { get set }
    var pinImage5: UIView { get set }
    var pinImage6: UIView { get set }
    var timeLable: UILabel { get set }
    func createTime()
    func bubbleAnimation()
    var timer: Timer! { get set }
}

class PinCodeViewImpl: UIView, PinCodeViewProtocol {
    
    private var timeItem = 15
    var timer: Timer!
    
    internal var backButton: UIButton = {
        $0.setImage(UIImage(systemName: "arrow.left", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.9582243562, green: 0.9509575963, blue: 0.9842651486, alpha: 1)
        $0.tintColor = #colorLiteral(red: 0.6851776242, green: 0.7179468274, blue: 0.7610188127, alpha: 1)
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton(type: .system))
    
    private let enterCodeLabel = UILabel(text: "Next, enter the code we sent 😍",
                                         numberLines: 0,
                                         textColor: #colorLiteral(red: 0.2110047936, green: 0.2157777548, blue: 0.2200372517, alpha: 1),
                                         font: .sfCompactRounded26(),
                                         alignment: .left)
    
    private let phoneNumberLabel = UILabel(text: "VERIFICATION CODE",
                                           numberLines: 0,
                                           textColor: #colorLiteral(red: 0.5071314573, green: 0.5494142175, blue: 0.6010261178, alpha: 1),
                                           font: .sfCompactRounded16(),
                                           alignment: .left)
    
    internal var pinTextField1: UITextField = {
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        $0.textAlignment = .center
        $0.keyboardType = .phonePad
        $0.layer.cornerRadius = 17
        $0.tintColor = .clear
        return $0
    }(UITextField())
    
    internal var pinTextField2: UITextField = {
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        $0.textAlignment = .center
        $0.keyboardType = .phonePad
        $0.layer.cornerRadius = 17
        $0.tintColor = .clear
        return $0
    }(UITextField())
    
    internal var pinTextField3: UITextField = {
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        $0.textAlignment = .center
        $0.keyboardType = .phonePad
        $0.layer.cornerRadius = 17
        $0.tintColor = .clear
        return $0
    }(UITextField())
    
    internal var pinTextField4: UITextField = {
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        $0.textAlignment = .center
        $0.keyboardType = .phonePad
        $0.layer.cornerRadius = 17
        $0.tintColor = .clear
        return $0
    }(UITextField())
    
    internal var pinTextField5: UITextField = {
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        $0.textAlignment = .center
        $0.keyboardType = .phonePad
        $0.layer.cornerRadius = 17
        $0.tintColor = .clear
        return $0
    }(UITextField())
    
    internal var pinTextField6: UITextField = {
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        $0.textAlignment = .center
        $0.keyboardType = .phonePad
        $0.layer.cornerRadius = 17
        $0.tintColor = .clear
        return $0
    }(UITextField())
    
    internal var timeLable = UILabel(text: nil,
                                    numberLines: 1,
                                    textColor: #colorLiteral(red: 0.5071314573, green: 0.5494142175, blue: 0.6010261178, alpha: 1),
                                    font: .sfCompactRounded16(),
                                    alignment: .center)
    
    internal var doneButton = UIButton(text: "Resend Code",
                                      tintColor: .white,
                                      cornerRadius: 23,
                                      backgroundColor: #colorLiteral(red: 0.1580005288, green: 0.7216834426, blue: 1, alpha: 1),
                                      font: .sfCompactRounded20())
    
    internal var pinView1: UIView = {
        $0.layer.cornerRadius = 21
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        return $0
    }(UIView())
    
    private var pinView2: UIView = {
        $0.layer.cornerRadius = 21
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        return $0
    }(UIView())
    
    private var pinView3: UIView = {
        $0.layer.cornerRadius = 21
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        return $0
    }(UIView())
    
    private var pinView4: UIView = {
        $0.layer.cornerRadius = 21
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        return $0
    }(UIView())
    
    private var pinView5: UIView = {
        $0.layer.cornerRadius = 21
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        return $0
    }(UIView())
    
    private var pinView6: UIView = {
        $0.layer.cornerRadius = 21
        $0.backgroundColor = #colorLiteral(red: 0.9453558326, green: 0.9448245764, blue: 0.9622151256, alpha: 1)
        return $0
    }(UIView())
    
    var answer = true
    
    var pinImage1: UIView = UIImageView(image: #imageLiteral(resourceName: "circle"))
    var pinImage2: UIView = UIImageView(image: #imageLiteral(resourceName: "circle"))
    var pinImage3: UIView = UIImageView(image: #imageLiteral(resourceName: "circle"))
    var pinImage4: UIView = UIImageView(image: #imageLiteral(resourceName: "circle"))
    var pinImage5: UIView = UIImageView(image: #imageLiteral(resourceName: "circle"))
    var pinImage6: UIView = UIImageView(image: #imageLiteral(resourceName: "circle"))
    
    //MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupImageInView()
        doneButton.alpha = 0.0
        initViews()
        createTime()
    }
    
    func initViews() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        pinImage1.tag = 1
        pinImage2.tag = 2
        pinImage3.tag = 3
        pinImage4.tag = 4
        pinImage5.tag = 5
        pinImage6.tag = 6
        
        backButton.pin(to: self).top().marginTop(65).left().marginLeft(15).width(45).height(45)
        enterCodeLabel.pin(to: self).below(of: backButton).marginTop(18).left(25).width(300).height(100)
        phoneNumberLabel.pin(to: self).below(of: enterCodeLabel).marginTop(10).left(25).width(150).height(30)
        
        pinView1.pin(to: self).below(of: phoneNumberLabel).marginTop(10).left(23).width(53).height(53)
        pinView2.pin(to: self).after(of: pinView1, aligned: .center).margin(10).width(53).height(53)
        pinView3.pin(to: self).after(of: pinView2, aligned: .center).margin(10).width(53).height(53)
        pinView4.pin(to: self).after(of: pinView3, aligned: .center).margin(10).width(53).height(53)
        pinView5.pin(to: self).after(of: pinView4, aligned: .center).margin(10).width(53).height(53)
        pinView6.pin(to: self).after(of: pinView5, aligned: .center).margin(10).width(53).height(53)

        timeLable.pin(to: self).below(of: pinView6).marginTop(190).hCenter().height(50).width(180)
        doneButton.pin(to: self).below(of: pinView6).marginTop(190).horizontally(27).height(53)
    }
    
    func createTime() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateTimeLable),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func stateTextField() {
    }
    
    @objc func updateTimeLable() {
        if timeItem != 0 {
            timeLable.text = "Resend Code in \(timeItem) sec"
            timeItem -= 1
        } else {
            self.timer.invalidate()
            timeItem = 15
            self.doneButton.alpha = 1.0
        }
    }
    
    private func setupImageInView() {
        pinView1 = pinTextField1
        pinView2 = pinTextField2
        pinView3 = pinTextField3
        pinView4 = pinTextField4
        pinView5 = pinTextField5
        pinView6 = pinTextField6
        
        pinImage1.pin(to: pinView1).top(19).left(19).height(13).width(13)
        pinImage2.pin(to: pinView2).top(19).left(19).height(13).width(13)
        pinImage3.pin(to: pinView3).top(19).left(19).height(13).width(13)
        pinImage4.pin(to: pinView4).top(19).left(19).height(13).width(13)
        pinImage5.pin(to: pinView5).top(19).left(19).height(13).width(13)
        pinImage6.pin(to: pinView6).top(19).left(19).height(13).width(13)
    }
    
    func bubbleAnimation() {
        UIView.animate(withDuration: 0.08,
                       animations: {
                        self.pinTextField1.frame.origin.x += 25
                        self.pinTextField2.frame.origin.x += 25
                        self.pinTextField3.frame.origin.x += 25
                        self.pinTextField4.frame.origin.x += 25
                        self.pinTextField5.frame.origin.x += 25
                        self.pinTextField6.frame.origin.x += 25
        }) { _ in
            UIView.animate(withDuration: 0.08,
                           animations: {
                            self.pinTextField1.frame.origin.x -= 50
                            self.pinTextField2.frame.origin.x -= 50
                            self.pinTextField3.frame.origin.x -= 50
                            self.pinTextField4.frame.origin.x -= 50
                            self.pinTextField5.frame.origin.x -= 50
                            self.pinTextField6.frame.origin.x -= 50
            }) { _ in
                UIView.animate(withDuration: 0.08,
                               animations: {
                                self.pinTextField1.frame.origin.x += 50
                                self.pinTextField2.frame.origin.x += 50
                                self.pinTextField3.frame.origin.x += 50
                                self.pinTextField4.frame.origin.x += 50
                                self.pinTextField5.frame.origin.x += 50
                                self.pinTextField6.frame.origin.x += 50
                }, completion: {_ in
                    UIView.animate(withDuration: 0.08,
                                   animations: {
                                    self.pinTextField1.frame.origin.x -= 50
                                    self.pinTextField2.frame.origin.x -= 50
                                    self.pinTextField3.frame.origin.x -= 50
                                    self.pinTextField4.frame.origin.x -= 50
                                    self.pinTextField5.frame.origin.x -= 50
                                    self.pinTextField6.frame.origin.x -= 50
                    }) { _ in
                        UIView.animate(withDuration: 0.08,
                                       animations: {
                                        self.pinTextField1.frame.origin.x += 50
                                        self.pinTextField2.frame.origin.x += 50
                                        self.pinTextField3.frame.origin.x += 50
                                        self.pinTextField4.frame.origin.x += 50
                                        self.pinTextField5.frame.origin.x += 50
                                        self.pinTextField6.frame.origin.x += 50
                        }, completion: {_ in
                            UIView.animate(withDuration: 0.08,
                                           animations: {
                                            self.pinTextField1.frame.origin.x -= 35
                                            self.pinTextField2.frame.origin.x -= 35
                                            self.pinTextField3.frame.origin.x -= 35
                                            self.pinTextField4.frame.origin.x -= 35
                                            self.pinTextField5.frame.origin.x -= 35
                                            self.pinTextField6.frame.origin.x -= 35
                            }, completion: {_ in
                                UIView.animate(withDuration: 0.08,
                                               animations: {
                                                self.pinTextField1.frame.origin.x += 10
                                                self.pinTextField2.frame.origin.x += 10
                                                self.pinTextField3.frame.origin.x += 10
                                                self.pinTextField4.frame.origin.x += 10
                                                self.pinTextField5.frame.origin.x += 10
                                                self.pinTextField6.frame.origin.x += 10
                                }, completion: nil)
                            })
                        })
                    }
                })
            }
        }
    }
}
