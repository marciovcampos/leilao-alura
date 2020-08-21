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
    
    var sut:LeiloesViewController!

    override func setUp() {
         sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as! LeiloesViewController
    }

    override func tearDown() {
    }
    
    func testTableViewNaoDeveEstarNilAposViewDidLoad(){
        _ = sut.view
        
        XCTAssertNotNil(sut.tableView)
    }
    
    func testDataSourceDaTableViewNaoDeveSerNil(){
        _ = sut.view
        
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertNotNil(sut.tableView.dataSource is LeiloesViewController)
    }
    
    func testNumberOfRowsInSectionDeveSerQuantidadeDeLeiloesDaLista(){
        let tableView = UITableView()
        tableView.dataSource = sut
        
        sut.addLeilao(Leilao(descricao: "Playstation 4"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.addLeilao(Leilao(descricao: "Iphone 11"))
        tableView.reloadData()        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        
    }
  

}
