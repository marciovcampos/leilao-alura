//
//  GeradorDePagamento.swift
//  Leilao
//
//  Created by Marcio Vinicius Campos da Silveira on 20/08/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import Foundation

class GeradorDePagamento {
    
    private var leiloes:LeilaoDao
    private var avaliador:Avaliador
    private var repositorioDePagamento:RepositorioDePagamento
    
    init(_ leiloes:LeilaoDao, _ avaliador: Avaliador,_ repositorioDePagamento: RepositorioDePagamento){
        self.leiloes = leiloes
        self.avaliador = avaliador
        self.repositorioDePagamento = repositorioDePagamento
    }
    
    func gera(){
        let leiloesEncerrados = self.leiloes.encerrados()
        
        for leilao in leiloesEncerrados {
            try? avaliador.avalia(leilao: leilao)
            
            let novoPagamento = Pagamento(avaliador.maiorLance(), Date())
            repositorioDePagamento.salva(novoPagamento)
            
        }
    }
    
    
    
}
