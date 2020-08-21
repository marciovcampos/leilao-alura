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
    var tableView: UITableView!

    override func setUp() {
         sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as! LeiloesViewController
        _ = sut.view
        tableView = sut.tableView
        tableView.dataSource = sut
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
        
        tableView.dataSource = sut
        
        sut.addLeilao(Leilao(descricao: "Playstation 4"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.addLeilao(Leilao(descricao: "Iphone 11"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
        
    }
    
    func testCellForRowDeveRetornarLeilaoTableViewCell(){
        sut.addLeilao(Leilao(descricao: "TV Led"))
        
        tableView.reloadData()
        
        let celula = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(celula is LeilaoTableViewCell)
        
    }
    
    func testCellForRowDeveChamarDequeueReusableCell(){
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        
        mockTableView.register(LeilaoTableViewCell.self, forCellReuseIdentifier: "LeilaoTableViewCell")
        
        sut.addLeilao(Leilao(descricao: "Macbook Pro"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.celulaFoiReutilizada)
        
    }
  

}

extension LeiloesViewControllerTests {
    class MockTableView: UITableView {
        var celulaFoiReutilizada = false
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            celulaFoiReutilizada = true
            return super.dequeueReusableCell(withIdentifier: "LeilaoTableViewCell", for: indexPath)
        }
    }
}
