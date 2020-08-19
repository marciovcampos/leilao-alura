//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Marcio Vinicius Campos da Silveira on 18/08/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {
    
    private var leiloeiro:Avaliador!
    private var joao:Usuario!
    private var maria:Usuario!
    private var jose:Usuario!
    
   override func setUp() {
        super.setUp()
        
        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
        leiloeiro=Avaliador()
    }
          
   override func tearDown() {
       super.tearDown()
   }
    
    func testDeveEntenderLancesEmOrdemCrescente(){
        // Cenario
         let leilao = Leilao(descricao: "Playstation 4")
         leilao.propoe(lance: Lance(maria, 250.0))
         leilao.propoe(lance: Lance(joao, 300.0))
         leilao.propoe(lance: Lance(jose, 400.0))
         
         // Acao
         leiloeiro.avalia(leilao: leilao)
         
         // Validacao
             
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())
        
    }
    
    
    func testDeveEntenderLeilaoComApenasUmLance(){
        // Cenario
         let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(joao, 1000))
         
         // Acao
         leiloeiro.avalia(leilao: leilao)
         
         // Validacao
             
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testDeveEncontrarOsTresMaioresLances() {
               
        let leilao = CriadorDeLeilao().para(descricao: "Playstation 4")
            .lance(joao, 300.0)
            .lance(maria, 400.0)
            .lance(joao, 500.0)
            .lance(maria, 600.0)
            .constroi()
        
        leiloeiro.avalia(leilao: leilao)
        
        let listaLances = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(600.0, listaLances[0].valor)
        XCTAssertEqual(500.0, listaLances[1].valor)
        XCTAssertEqual(400.0, listaLances[2].valor)
        
    }
    

}
