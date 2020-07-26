//
//  SetupProfilePhotoViewController.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by Artem Pozdnyakov on 7/22/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit

class SetupProfilePhotoViewController: UIViewController {
    
    private let profileView: SetupProfilePhotoProtocol
    let imagePicker = UIImagePickerController()
    
    init(setupProfileView: SetupProfilePhotoProtocol) {
        self.profileView = setupProfileView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupeGesture()
        imagePicker.delegate = self
        
    }
    
    func setupeGesture() {
        profileView.addDoneButton.addTarget(self, action: #selector(addDone), for: .touchUpInside)
        profileView.backButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        profileView.editButton.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
    }
    
    @objc func backButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addDone() {
        if profileView.addDoneButton.titleLabel?.text == "Add Photo" {
             showAlert()
        } else if profileView.addDoneButton.titleLabel?.text == "Done" {
            let alert = UIAlertController(title: "Succes", message: "You did it! 🙃", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
       }
    
    @objc func addPhoto() {
        showAlert()
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Select photo", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Camera roll", style: .default, handler: { alert in
            self.imagePicker.sourceType = .savedPhotosAlbum
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Photo library", style: .default, handler: { alert in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
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

extension SetupProfilePhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickImage = info[.originalImage] as? UIImage {
            self.profileView.photoView.image =  pickImage
            self.profileView.addDoneButton.titleLabel?.text = "Done"
            self.profileView.addDoneButton.setTitle("Done", for: .normal)
            self.profileView.editButton.isHidden = false
        }
        dismiss(animated: true, completion: nil)
    }
}
