//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by sara.batista.d.felix on 21/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // outro jto de add textField: segure diretamente na caixinhha de texto e com o ctrl puxe para o código
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var felicidadeTextField: UITextField!
    
    @IBAction func adicionar(_ sender: Any) {
        let nome = nomeTextField.text
        let felicidade = felicidadeTextField.text
        
        print("comi \(nome) e fiquei com felicidade: \(felicidade)")
    }
}
