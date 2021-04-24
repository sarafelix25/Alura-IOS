//
//  Item.swift
//  eggplant-brownie
//
//  Created by sara.batista.d.felix on 23/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    // MARK: - Atributos
    
    let nome: String
    let calorias: Double
    
    // MARK: - Init
    
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
}
