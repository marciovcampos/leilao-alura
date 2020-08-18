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

   override func setUp() {
    super.setUp()
    }
          
   override func tearDown() {
       super.tearDown()
   }
    
    func testDeveEntenderLancesEmOrdemCrescente(){
        // Cenario
             
         let joao = Usuario(nome: "Joao")
         let jose = Usuario(nome: "Jose")
         let maria = Usuario(nome: "Maria")
         
         let leilao = Leilao(descricao: "Playstation 4")
         leilao.propoe(lance: Lance(maria, 250.0))
         leilao.propoe(lance: Lance(joao, 300.0))
         leilao.propoe(lance: Lance(jose, 400.0))
         
         // Acao
         
         let leiloeiro = Avaliador()
         leiloeiro.avalia(leilao: leilao)
         
         // Validacao
             
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())
        
    }

}
