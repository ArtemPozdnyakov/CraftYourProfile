//
//  PinCodeViewController.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by Artem Pozdnyakov on 7/8/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit

class PinCodeViewController: UIViewController {
    
    
    var pin: String
    var textTag = 0
    var imageTag = 0
    var userCode = ""
    var setPin: SetupPinCode = SetupPinCode()
    private let pinView: PinCodeViewProtocol
    
    init(pinView: PinCodeViewProtocol, pin: String) {
        self.pinView = pinView
        self.pin = pin
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = pinView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        pinView.pinTextField1.delegate = self
        pinView.pinTextField2.delegate = self
        pinView.pinTextField3.delegate = self
        pinView.pinTextField4.delegate = self
        pinView.pinTextField5.delegate = self
        pinView.pinTextField6.delegate = self
    }
    
    private func setupGesture() {
        let tapGestureBackButton = UITapGestureRecognizer(target: self, action: #selector(backVC))
        let tapGestureInfoUserView = UITapGestureRecognizer(target: self, action: #selector(resendCode))
        pinView.backButton.addGestureRecognizer(tapGestureBackButton)
        pinView.doneButton.addGestureRecognizer(tapGestureInfoUserView)
    }
    
    @objc func backVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func resendCode() {
        pin = setPin.randomPIN()
        pinView.doneButton.alpha = 0.0
        let alert = UIAlertController(title: "Success", message: "A PIN code \(pin) has been sent to your phone number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true) {
            self.pinView.createTime()
        }
    }
    
    func successPin() {
        let alert = UIAlertController(title: "Success", message: "Go to Create your Profile! 😍", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { alertAction in
            let vc = InfoUserViewController(infoUserView: InfoUserViewImpl())
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension PinCodeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let image = [self.pinView.pinImage1,
                     self.pinView.pinImage2,
                     self.pinView.pinImage3,
                     self.pinView.pinImage4,
                     self.pinView.pinImage5,
                     self.pinView.pinImage6]
        
        var textF = [self.pinView.pinTextField1,
                     self.pinView.pinTextField2,
                     self.pinView.pinTextField3,
                     self.pinView.pinTextField4,
                     self.pinView.pinTextField5,
                     self.pinView.pinTextField6]
        
        textF[textTag].text = string
        
        if textField.text != nil {
            image[imageTag].isHidden = true
            userCode += string
            if textTag != 5 {
                textTag += 1
                textF[textTag].becomeFirstResponder()
                imageTag += 1
            } else {
                if userCode == pin {
                    view.endEditing(true)
                    
                    UIView.animate(withDuration: 1.7) {
                        self.pinView.timer?.invalidate()
                        self.pinView.doneButton.alpha = 0.0
                        self.pinView.timeLable.alpha = 1.0
                        self.pinView.timeLable.text = "Perfect 😌"
                    }
                    successPin()
                } else {
                    self.pinView.bubbleAnimation()
                    
                    for i in 0..<image.count {
                        image[i].isHidden = false
                        textF[i].text = ""
                    }
                    imageTag = 0
                    textTag = 0
                    textF[textTag].becomeFirstResponder()
                    userCode = ""
                }
            }
        }
        return false
    }
}
