//
//  User.swift
//  SQLiteSwift
//
//  Created by Vitor Mendes on 23/10/18.
//  Copyright © 2018 Vitor Mendes. All rights reserved.
//

import Foundation

class User {
    
    var id: Int
    var nome: String?
    var endereco: String?
    var telefone: String?
    
    init(id: Int, nome: String?, endereco: String?, telefone: String?){
        self.id = id
        self.nome = nome
        self.endereco = endereco
        self.telefone = telefone
    }
}
