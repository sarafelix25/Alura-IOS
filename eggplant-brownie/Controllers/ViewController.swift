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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // Mark: - IBOutlets
    
    @IBOutlet weak var itensTableView: UITableView!
    
    
    // Mark: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Molho de tomate", calorias: 40.0),
                         Item(nome: "Queijo", calorias: 40.0),
                         Item(nome: "Molho apimentado", calorias: 40.0),
                         Item(nome: "Manjericão", calorias: 40.0),]
    
    var itensSelecionados: [Item] = []
    
    // Mark: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // Mark: View life cycle
    
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    
    @objc func adicionarItens() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add (_ item: Item){
        itens.append(item)
        itensTableView.reloadData()
    }
    
    // Mark: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
        
        // MARK: - UITableViewDelegate
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard let celula = tableView.cellForRow(at: indexPath) else { return }

            if celula.accessoryType ==  .none {
                celula.accessoryType = .checkmark

                let linhaDaTabela = indexPath.row
                itensSelecionados.append(itens[linhaDaTabela])
            } else {
                celula.accessoryType = .none
    
                let item = itens[indexPath.row]
                
                if let position = itensSelecionados.index(of: item) {
                
                itensSelecionados.remove(at: position)
            }
        }
    }
    
    // Mark: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
}
