//
//  UserViewCell.swift
//  SQLiteSwift
//
//  Created by Vitor Mendes on 23/10/18.
//  Copyright © 2018 Vitor Mendes. All rights reserved.
//

import UIKit

class UserViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Identifier has not been implemeted")
    }
    
    var id = 0
    
    let nomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let telefoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let enderecoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews()
    {
        addSubview(nomeLabel)
        nomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        nomeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        nomeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        addSubview(telefoneLabel)
        telefoneLabel.topAnchor.constraint(equalTo: nomeLabel.bottomAnchor, constant: 16).isActive = true
        telefoneLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive =  true
        telefoneLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        enderecoLabel.topAnchor.constraint(equalTo: telefoneLabel.bottomAnchor, constant: 16).isActive = true
        enderecoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        enderecoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        enderecoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
}
