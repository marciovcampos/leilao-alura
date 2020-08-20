//
//  EncerradorDeLeilaoTests.swift
//  LeilaoTests
//
//  Created by Marcio Vinicius Campos da Silveira on 19/08/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import XCTest
@testable import Leilao
import Cuckoo

class EncerradorDeLeilaoTests: XCTestCase {
    
    var formatador: DateFormatter!

    override func setUp() {
        super.setUp()
        formatador = DateFormatter()
        formatador.dateFormat = "yyyy/MM/dd"
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testDeveEncerrarLeiloesQueComecaramUmaSemanaAntes(){
        guard let dataAntiga = formatador.date(from: "2018/05/09") else { return }
        
        let tvLed = CriadorDeLeilao().para(descricao: "TV Led").naData(data: dataAntiga).constroi()
        let geladeira = CriadorDeLeilao().para(descricao: "Geladeira").naData(data: dataAntiga).constroi()
        
        let leiloesAntigos = [tvLed, geladeira]
        
        let daoFalso = MockLeilaoDao().withEnabledSuperclassSpy()
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.correntes()).thenReturn(leiloesAntigos)
        }

        let encerradoDeLeilao = EncerradorDeLeilao(daoFalso)
        encerradoDeLeilao.encerra()
                
        guard let statusTvLed = tvLed.isEncerrado() else { return }
        guard let statusGeladeira = geladeira.isEncerrado() else { return }
                
        XCTAssertEqual(2, encerradoDeLeilao.getTotalEncerrados())
        XCTAssertTrue(statusTvLed)
        XCTAssertTrue(statusGeladeira)
                
    }
    
    func testDeveAtualizarLeiloesEncerrados(){
        
        guard let dataAntiga = formatador.date(from: "2018/05/19") else { return }
        let tvLed = CriadorDeLeilao().para(descricao: "TV Led").naData(data: dataAntiga).constroi()
        
        let daoFalso = MockLeilaoDao().withEnabledSuperclassSpy()
        
        stub(daoFalso) { (daoFalso) in
            when(daoFalso.correntes()).thenReturn([tvLed])
        }
        
        let encerradoDeLeilao = EncerradorDeLeilao(daoFalso)
        encerradoDeLeilao.encerra()
        
        verify(daoFalso).atualiza(leilao: tvLed)
        
    }
}

extension Leilao : Matchable {
    public var matcher: ParameterMatcher<Leilao> {
        return equal(to: self)
    }
}
