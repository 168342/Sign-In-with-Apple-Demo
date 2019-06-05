//
//  HomeViewController.swift
//  SignInWithAppleDemo
//
//  Created by Vineet Choudhary on 05/06/19.
//  Copyright © 2019 Developer Insider. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak private var userIdentifierLabel: UILabel!
    @IBOutlet weak private var firstNameLabel: UILabel!
    @IBOutlet weak private var lastNameLabel: UILabel!
    @IBOutlet weak private var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userIdentifierLabel.text = KeychainItem.currentUserIdentifier
        firstNameLabel.text = KeychainItem.currentUserFirstName
        lastNameLabel.text = KeychainItem.currentUserLastName
        emailLabel.text = KeychainItem.currentUserEmail
    }
    
    static func Push() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
            else { return }
        guard let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
            else { return }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    @IBAction func logoutButtonPressAction(_ sender: UIButton) {
        KeychainItem.currentUserIdentifier = nil
        KeychainItem.currentUserFirstName = nil
        KeychainItem.currentUserLastName = nil
        KeychainItem.currentUserEmail = nil
        
        guard let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
            else { return }
        navigationController.popViewController(animated: true)
    }
}
