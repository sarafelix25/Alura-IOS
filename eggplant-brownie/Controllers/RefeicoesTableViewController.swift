//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by sara.batista.d.felix on 24/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit


class RefeicoesTableviewController: UITableViewController, AdicionaRefeicaoDelegate {
 
    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Comida Japonesa", felicidade: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let refeicao = refeicoes[indexPath.row]
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
    
    func add (_ refeicao: Refeicao) {
    refeicoes.append(refeicao)
    tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "adicionar"{
            if let viewController = segue.destination as? ViewController{
                viewController.delegate = self
            }
        }
    }
}
