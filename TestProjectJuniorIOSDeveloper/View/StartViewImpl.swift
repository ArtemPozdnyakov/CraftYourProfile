//
//  FirstView.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by admin on 7/2/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit
import PinLayout
import SwiftUI

protocol StartViewProtocol: UIView {
    var letsGoButton: UIButton { get }
    var termsButton: UIButton { get }
    var privacePolicyButton: UIButton { get }
    func emojiAnimation()
}

class StartViewImpl: UIView, StartViewProtocol {
    
    //MARK: - View object
    
    private var smailView: UIImageView = {
        $0.backgroundColor = .white
        $0.image = #imageLiteral(resourceName: "рожи-1")
        $0.layer.cornerRadius = 23
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private let craftYourProfileLable = UILabel(text: "Craft Your Profile",
                                                numberLines: 0,
                                                textColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                                font: .sfCompactRounded26(),
                                                alignment: .center)
    
    private let infoCraftYour = UILabel(text: "Create a profile, follow other accounts, make your own lives!",
                                        numberLines: 0,
                                        textColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),
                                        font: .sfCompactRounded18(),
                                        alignment: .center)
    
    internal var letsGoButton = UIButton(text: "LET'S GO!!!",
                                         tintColor: #colorLiteral(red: 0.02745098039, green: 0.03137254902, blue: 0.0431372549, alpha: 1),
                                         cornerRadius: 22,
                                         backgroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                         font: .sfCompactRounded20())
    
    private let termsLable = UILabel(text: "By signing up, you agree to our",
                                     numberLines: 1,
                                     textColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),
                                     font: .sfCompactRounded16(),
                                     alignment: .center)
    
    internal var termsButton: UIButton = {
        $0.setTitle("Terms", for: .normal)
        $0.titleLabel?.font = .sfCompactRounded16()
        $0.backgroundColor = .clear
        $0.tintColor = .white
        return $0
    }(UIButton(type: .system))
    
    private let privacePolicyLable = UILabel(text: "and",
                                             numberLines: 1,
                                             textColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),
                                             font: .sfCompactRounded16(),
                                             alignment: .center)
    
    internal var privacePolicyButton: UIButton = {
        $0.setTitle("Privacy Policy", for: .normal)
        $0.titleLabel?.font = .sfCompactRounded16()
        $0.backgroundColor = .clear
        $0.tintColor = .white
        return $0
    }(UIButton(type: .system))
    
    
    private let safaryIcon: UIButton = {
        $0.backgroundColor = #colorLiteral(red: 0.3999311328, green: 0.497951448, blue: 0.7857168913, alpha: 1)
        $0.setImage(UIImage(systemName: "safari.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 23
        return $0
    }(UIButton(type: .system))
    
    private let houseIcon: UIButton = {
        $0.backgroundColor = #colorLiteral(red: 0.0138715189, green: 0.6647673249, blue: 0.9995570779, alpha: 1)
        $0.setImage(UIImage(systemName: "house.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 25
        return $0
    }(UIButton(type: .system))
    
    private let circleIcon: UIButton = {
        $0.backgroundColor = #colorLiteral(red: 0.3999311328, green: 0.497951448, blue: 0.7857168913, alpha: 1)
        $0.setImage(UIImage(systemName: "smallcircle.circle.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .light)), for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 23
        return $0
    }(UIButton(type: .system))
    
    var check = true
    
    //MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        initViews()
        if check {
            emojiAnimation()
            check = false
        }
    }
    
    func initViews() {
        backgroundColor = #colorLiteral(red: 0.1904361844, green: 0.3712905049, blue: 0.8902673125, alpha: 1)
        
        smailView.pin(to: self).hCenter().vCenter(-120).height(73).width(73)//top(270).height(73).width(73)
        craftYourProfileLable.pin(to: self).below(of: smailView, aligned: .center).marginTop(30).width(300).height(20)
        infoCraftYour.pin(to: self).below(of: craftYourProfileLable, aligned: .center).marginTop(15).width(300).height(50)
        letsGoButton.pin(to: self).below(of: infoCraftYour, aligned: .center).marginTop(30).width(200).height(50)
        
        safaryIcon.pin(to: self).bottom().above(of: self, aligned: .center).marginBottom(60).width(55).height(55)
        houseIcon.pin(to: self).bottom(40).right(of: safaryIcon).marginLeft(30).width(60).height(60)
        circleIcon.pin(to: self).bottom(40).left(of: safaryIcon).marginRight(30).width(55).height(55)
        
        privacePolicyButton.pin(to: self).above(of: safaryIcon, aligned: .center).marginBottom(30).marginLeft(20).width(105).height(7)
        privacePolicyLable.pin(to: self).before(of: privacePolicyButton, aligned: .center).width(40).height(20)
        
        termsLable.pin(to: self).above(of: privacePolicyButton, aligned: .center).marginBottom(5).marginLeft(-47).width(225).height(20)
        termsButton.pin(to: self).after(of: termsLable, aligned: .center).marginLeft(0).width(59).height(8)
        
        iconAnimation()
    }
    
    //MARK: - Animation
    private func iconAnimation() {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [],
                       animations: {
                        self.houseIcon.transform = CGAffineTransform(rotationAngle: 0.2)
                        self.circleIcon.transform = CGAffineTransform(rotationAngle: -0.2)
        })
    }
    
    func emojiAnimation() {
        let emoji1 = CAEmitterCell()
        emoji1.contents = UIImage(named: "emoji1")?.cgImage
        emoji1.scale = 0.15
        emoji1.birthRate = 0.5
        emoji1.lifetime = 20
        emoji1.velocity = -50
        emoji1.velocityRange = -30
        emoji1.yAcceleration = -30
        
        let emoji2 = CAEmitterCell()
        emoji2.contents = UIImage(named: "emoji2")?.cgImage
        emoji2.scale = 0.15
        emoji2.birthRate = 0.5
        emoji2.lifetime = 20
        emoji2.velocity = -30
        emoji2.velocityRange = -20
        emoji2.yAcceleration = -30
        
        let emoji3 = CAEmitterCell()
        emoji3.contents = UIImage(named: "emoji3")?.cgImage
        emoji3.scale = 0.15
        emoji3.birthRate = 0.5
        emoji3.lifetime = 20
        emoji3.velocity = -50
        emoji3.velocityRange = -30
        emoji3.yAcceleration = -30
        
        let emoji4 = CAEmitterCell()
        emoji4.contents = UIImage(named: "emoji4")?.cgImage
        emoji4.scale = 0.15
        emoji4.birthRate = 0.5
        emoji4.lifetime = 20
        emoji4.velocity = -30
        emoji4.velocityRange = -20
        emoji4.yAcceleration = -30
        
        let emoji5 = CAEmitterCell()
        emoji5.contents = UIImage(named: "emoji5")?.cgImage
        emoji5.scale = 0.15
        emoji5.birthRate = 0.5
        emoji5.lifetime = 20
        emoji5.velocity = -50
        emoji5.velocityRange = -30
        emoji5.yAcceleration = -30
        
        let snowEmitterLayer = CAEmitterLayer()
        snowEmitterLayer.emitterPosition = CGPoint(x: bounds.width / 2, y: 1300)
        snowEmitterLayer.emitterSize = CGSize(width: bounds.width, height: 0)
        snowEmitterLayer.emitterShape = .line
        snowEmitterLayer.beginTime = CACurrentMediaTime()
        snowEmitterLayer.timeOffset = 10
        snowEmitterLayer.emitterCells = [emoji1, emoji2, emoji3, emoji4, emoji5,]
        layer.addSublayer(snowEmitterLayer)
    }
}
