//
//  ViewController.swift
//  TestProjectJuniorIOSDeveloper
//
//  Created by admin on 7/2/20.
//  Copyright © 2020 Artem Pozdnyakov. All rights reserved.
//

import UIKit
import SafariServices

class StartViewController: UIViewController {
    
    let firstView: StartViewProtocol
    
    init(firstView: StartViewProtocol) {
        self.firstView = firstView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = firstView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goPhoneViewController()
    }
    
    private func goPhoneViewController() {
        let tapGesturePhoveVC = UITapGestureRecognizer(target: self, action: #selector(goPhoneVC))
        let tapGesturePrivace = UITapGestureRecognizer(target: self, action: #selector(privase))
        let tapGestureTerms = UITapGestureRecognizer(target: self, action: #selector(terms))
        firstView.letsGoButton.addGestureRecognizer(tapGesturePhoveVC)
        firstView.privacePolicyButton.addGestureRecognizer(tapGesturePrivace)
        firstView.termsButton.addGestureRecognizer(tapGestureTerms)
    }
    
    @objc func goPhoneVC() {
        let vc = PhoneViewController(phoneView: PhoneViewImpl(), tableCoutry: CountryCodeTableViewController())
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func privase() {
        let sfaryVC = SFSafariViewController(url: URL(string: "https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller")!)
        present(sfaryVC, animated: true, completion: nil)
    }
    
    @objc func terms() {
        let sfaryVC = SFSafariViewController(url: URL(string: "http://arkadia.xyz/")!)
        present(sfaryVC, animated: true, completion: nil)
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
