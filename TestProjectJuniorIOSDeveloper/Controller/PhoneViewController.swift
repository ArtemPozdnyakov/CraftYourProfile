//
//  PhoneViewController.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by Artem Pozdnyakov on 7/7/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit
import PhoneNumberKit

protocol UpdatePinCode: class {
    func updatePin(pin: String)
}

class PhoneViewController: UIViewController, UpdateCodePhoneDelegat {
    
    private let phoneView: PhoneViewProtocol
    private let countryCodeTableController: CountryCodeTableViewController
    
    private let phoneNumberKit = PhoneNumberKit()
    
    private var setPin: SetupPinCode = SetupPinCode()
    
    private var codeNumber = ""
    private var numberPhoneUser = ""
    private var matches = false
    
    init(phoneView: PhoneViewProtocol, tableCoutry: CountryCodeTableViewController) {
        self.phoneView = phoneView
        self.countryCodeTableController = tableCoutry
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = phoneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        nextButtonAnimation()
        countryCodeTableController.delegat = self
        phoneView.phoneTextField.delegate = self
    }
    
    private func nextButtonAnimation() {
        phoneView.nextButton.addTarget(self, action: #selector(go2VC), for: .touchUpInside)
    }
    
    func updateCodeCountry(text: String) {
        
        for (i, j) in text.enumerated() {
            if j != " " {
                codeNumber += String(j)
            } else {
                break
            }
        }
        phoneView.codeButton.titleLabel?.text = codeNumber
    }
    
    @objc func go2VC() {
            let animation = CASpringAnimation(keyPath: "transform.scale")
            animation.fromValue = 0.9
            animation.toValue = 1.0
            animation.stiffness = 200
            animation.mass = 1
            animation.duration = 1
            animation.beginTime = CACurrentMediaTime()
            animation.fillMode = CAMediaTimingFillMode.both
            phoneView.nextButton.layer.add(animation, forKey: nil)
    }
    
    private func setupGesture() {
        let tapGestur = UITapGestureRecognizer(target: self, action: #selector(tapped))
        let tapGestureClouse = UITapGestureRecognizer(target: self, action: #selector(clouseVC))
        let tapGesturePinVC = UITapGestureRecognizer(target: self, action: #selector(pinViewController))
        
        tapGestur.numberOfTapsRequired = 1
        tapGestureClouse.numberOfTapsRequired = 1
        tapGesturePinVC.numberOfTapsRequired = 1
        
        phoneView.codeButton.addGestureRecognizer(tapGestur)
        phoneView.clouseButton.addGestureRecognizer(tapGestureClouse)
        phoneView.nextButton.addGestureRecognizer(tapGesturePinVC)
    }
    
    @objc func tapped() {
        countryCodeTableController.modalPresentationStyle = .popover
        
        let popOverVC = countryCodeTableController.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = phoneView.codeButton
        popOverVC?.sourceRect = CGRect(x: phoneView.codeButton.bounds.maxX, y: phoneView.codeButton.bounds.midY, width: 0, height: 0)
        countryCodeTableController.preferredContentSize = CGSize(width: 235, height: 300)
        
        self.present(countryCodeTableController, animated: true)
        codeNumber = ""
    }
    
    @objc func clouseVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func pinViewController() {
        let pinNumber = setPin.randomPIN()
        let alert = UIAlertController(title: "Success", message: "A PIN code \(pinNumber) has been sent to your phone number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { alertAction in
            let vc = PinCodeViewController(pinView: PinCodeViewImpl(), pin: pinNumber)
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

extension PhoneViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension PhoneViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        numberPhoneUser += string
        
        do {
            print(codeNumber + numberPhoneUser)
            let phoneNumber = try phoneNumberKit.parse(codeNumber + numberPhoneUser)
            matches = true
            phoneView.nextButton.alpha = 1.0
            numberPhoneUser = ""
        }
        catch {
            print("Generic parser error")
        }
       return true
    }
}
