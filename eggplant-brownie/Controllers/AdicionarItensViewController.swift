//
//  AdicionarViewController.swift
//  eggplant-brownie
//
//  Created by sara.batista.d.felix on 24/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class AdicionarItensViewController: UIViewController {
    
    // Mark: - IBOutlets

    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    
    // Mark: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Mark: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else {
            return
        }
        
        if let numeroDeCalorias = Double(calorias){
            
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            navigationController?.popViewController(animated: true)
        }
    }
}
