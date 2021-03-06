//
//  ViewController.swift
//  SQLiteSwift
//
//  Created by Vitor Mendes on 23/10/18.
//  Copyright © 2018 Vitor Mendes. All rights reserved.
//

import UIKit
import SQLite3

protocol UpdateList {
    func getData()
}

class UserCadViewController: UIViewController {
    
    var db: OpaquePointer?
    
    var isEdit = false
    var user : User!
    
    var userCadView = UserCadView()
    
    var delegate: UpdateList!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        if isEdit
        {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Editar", style: .done, target: self, action: #selector(performEdit))
            userCadView.campoNome.text = user.nome
            userCadView.campoEndereco.text = user.endereco
            userCadView.campoTelefone.text = user.telefone
        }
        else
        {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(performSave))
        }
        
        view.addSubview(userCadView)
        userCadView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        userCadView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        userCadView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        userCadView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        
    }

}

extension UserCadViewController
{
    @objc func performSave()
    {
       let userDB = UserDB()
       userDB.save(user: User(id: 0, nome: userCadView.campoNome.text, endereco: userCadView.campoEndereco.text, telefone: userCadView.campoTelefone.text))
       delegate.getData()
       dismiss(animated: true)
    }
    
    @objc func performEdit()
    {
        let userDB = UserDB()
        userDB.update(user: User(id: user.id, nome: userCadView.campoNome.text, endereco: userCadView.campoEndereco.text, telefone: userCadView.campoTelefone.text))
        delegate.getData()
        dismiss(animated: true)
    }
}

