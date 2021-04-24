//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by sara.batista.d.felix on 23/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
        
        // MARK: - Atributos
        
        let nome: String
        let felicidade: Int
        let itens: Array<Item> = []
        
        // MARK: - Init
        
        init (nome: String, felicidade: Int){
            self.nome = nome
            self.felicidade = felicidade
        }
        
        // MARK: - Metodos
        
        func totalDeCalorias() -> Double {
            var total = 0.0
            
            for item in itens{
                total += item.calorias
            }
            
            return total
     }
}

