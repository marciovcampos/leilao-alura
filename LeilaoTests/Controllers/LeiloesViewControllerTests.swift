//
//  LeiloesViewControllerTests.swift
//  LeilaoTests
//
//  Created by Marcio Vinicius Campos da Silveira on 21/08/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class LeiloesViewControllerTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testTableViewNaoDeveEstarNilAposViewDidLoad(){
        let sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as! LeiloesViewController
        _ = sut.view
        
        XCTAssertNotNil(sut.tableView)
    }
  

}
