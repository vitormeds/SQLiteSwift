//
//  FieldView.swift
//  SQLiteSwift
//
//  Created by Vitor Mendes on 23/10/18.
//  Copyright © 2018 Vitor Mendes. All rights reserved.
//

import UIKit

class UserCadView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Identifier has not been implemeted")
    }
    
    let campoNome: UITextField = {
        let txt = UITextField()
        txt.font = UIFont.boldSystemFont(ofSize: 30)
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = NSLocalizedString("Nome", comment: "")
        txt.layer.cornerRadius = 15//arredonda as bordas
        return txt
    }()
    
    let campoTelefone: UITextField = {
        let txt = UITextField()
        txt.font = UIFont.boldSystemFont(ofSize: 30)
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = NSLocalizedString("Telefone", comment: "")
        txt.layer.cornerRadius = 15//arredonda as bordas
        return txt
    }()
    
    let campoEndereco: UITextField = {
        let txt = UITextField()
        txt.font = UIFont.boldSystemFont(ofSize: 30)
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = NSLocalizedString("Endereco", comment: "")
        txt.layer.cornerRadius = 15//arredonda as bordas
        return txt
    }()
    
    func setupViews()
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(campoNome)//adiciona a label na tela
        campoNome.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        campoNome.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        campoNome.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        campoNome.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(campoTelefone)//adiciona a label na tela
        campoTelefone.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        campoTelefone.topAnchor.constraint(equalTo: campoNome.bottomAnchor, constant: 8).isActive = true
        campoTelefone.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        campoTelefone.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(campoEndereco)//adiciona a label na tela
        campoEndereco.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        campoEndereco.topAnchor.constraint(equalTo: campoTelefone.bottomAnchor, constant: 8).isActive = true
        campoEndereco.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        campoEndereco.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
