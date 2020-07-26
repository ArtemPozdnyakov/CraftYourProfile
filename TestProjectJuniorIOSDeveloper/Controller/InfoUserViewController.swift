//
//  InfoUserViewController.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by Artem Pozdnyakov on 7/19/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit

class InfoUserViewController: UIViewController {
    
    private let infoUserView: InfoUserViewProtocol
    
    init(infoUserView: InfoUserViewProtocol) {
        self.infoUserView = infoUserView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = infoUserView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
    }
    
    private func setupGesture() {
        let tapGestureBackButton = UITapGestureRecognizer(target: self, action: #selector(backButton))
        infoUserView.backButton.addGestureRecognizer(tapGestureBackButton)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        view.addGestureRecognizer(tapGesture)
        
        let tapGestureHidden = UITapGestureRecognizer(target: self, action: #selector(setupPiker))
        infoUserView.dateBirthdayTextField.addGestureRecognizer(tapGestureHidden)
        
        let tapGestureButton = UITapGestureRecognizer(target: self, action: #selector(nextButton))
        infoUserView.nextButton.addGestureRecognizer(tapGestureButton)
        
        infoUserView.datePickerView.addTarget(self, action: #selector(targetPicker), for: .allEvents)
    }
    
    @objc func backButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func setupPiker() {
        view.endEditing(true)
        infoUserView.datePickerView.isHidden = false
    }
    
    @objc func tapped() {
        view.endEditing(true)
    }
    
    @objc func nextButton() {
        if infoUserView.nameTextField.text?.count != 0 && infoUserView.dateBirthdayTextField.text?.count != 0 {
            let vc = SetupProfilePhotoViewController(setupProfileView: SetupProfilePhotoImpl())
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Warning", message: "Date of birth or name not entered.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func targetPicker() {
        let date = infoUserView.datePickerView.date
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d y"
        infoUserView.dateBirthdayTextField.text = formatter.string(from: date)
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
