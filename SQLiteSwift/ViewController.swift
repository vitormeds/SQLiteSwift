//
//  ViewController.swift
//  SQLiteSwift
//
//  Created by Vitor Mendes on 23/10/18.
//  Copyright © 2018 Vitor Mendes. All rights reserved.
//

import UIKit

class UserCadViewController: UIViewController {
    
    var userCadView = UserCadView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        view.addSubview(userCadView)
        userCadView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        userCadView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        userCadView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        userCadView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        
    }

}

