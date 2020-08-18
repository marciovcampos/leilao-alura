//
//  LeilaoTests.swift
//  LeilaoTests
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDeveReceberUmLance() {
        let leilao = Leilao(descricao: "Macbook Pro 15")
        XCTAssertEqual(0, leilao.lances?.count)
        
        let steveJobs = Usuario(nome: "Steve Jobs")
        leilao.propoe(lance: Lance(steveJobs, 2000.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
        
    }
    
    
    
}
