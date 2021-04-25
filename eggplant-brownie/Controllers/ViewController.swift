//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by sara.batista.d.felix on 21/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
     func add (_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource {
    
    // Mark: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [String] = ["Molho de tomate", "Queijo", "Molho apimentado", "Manjericão"]
 
    // Mark: IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField?
    
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // Mark: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item
        
        return celula
    }
    
    // Mark: IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
}
