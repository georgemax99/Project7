//
//  ViewController.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import UIKit

//Controller from MVC

class ViewController: UIViewController {
    var titleView : TitleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
    }
    
    func initUI() {
        titleView = TitleView()
        titleView.loginButton.addTarget(self, action: #selector(loginSwitchAction), for: .touchUpInside)
        titleView.signupButton.addTarget(self, action: #selector(signupSwitchAction), for: .touchUpInside)
        view.addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        titleView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    @objc func loginSwitchAction() {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @objc func signupSwitchAction() {
        let vc = SignupViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }

}

