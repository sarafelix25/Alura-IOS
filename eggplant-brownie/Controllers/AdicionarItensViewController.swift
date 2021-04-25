//
//  AdicionarViewController.swift
//  eggplant-brownie
//
//  Created by sara.batista.d.felix on 24/04/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class AdicionarItensViewController: UIViewController {

    
    // Mark: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Mark: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
