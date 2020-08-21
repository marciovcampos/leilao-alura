//
//  LeiloesViewController.swift
//  Leilao
//
//  Created by Marcio Vinicius Campos da Silveira on 21/08/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class LeiloesViewController: UIViewController, UITableViewDataSource {
    

    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Atributos
    
    private var listaDeLeiloes:[Leilao] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeLeiloes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return LeilaoTableViewCell()
    }
    
    // MARK: - Metodos
    
    func addLeilao(_ leilao:Leilao){
        listaDeLeiloes.append(leilao)
    }
    
      

   

}
