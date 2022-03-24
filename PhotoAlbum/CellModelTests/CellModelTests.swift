//
//  CellModelTests.swift
//  CellModelTests
//
//  Created by 최예주 on 2022/03/22.
//

import XCTest
@testable import PhotoAlbum

class CellModelTests: XCTestCase {
    
    var colorCellModel: ColorCellModel!
    var cells: CellCollection!
    
    override func setUpWithError() throws {
        colorCellModel = ColorCellModel()
        cells = CellCollection()
    }
    
    // ColorCellModel
    func testGetColor() throws {
        XCTAssertEqual(colorCellModel.color, colorCellModel.getColor())
    }
    
    //CellCollection
    func testCellCollectionCount() throws {
        cells.addCell(with: colorCellModel)
        XCTAssertEqual(cells.count,1)
    }
    
    func testCellCollectionSubscript() throws {
        cells.addCell(with: colorCellModel)
        XCTAssertEqual(cells[0] as! ColorCellModel, colorCellModel)
    }
    
    //CellModelFactory
    func testCellModelFactory() throws {
        let count = 3
        let cells = CellModelFactory.makeColorCells(count: count)
        XCTAssertEqual(cells.count,count)
    }
    
    
    
    
    

    

    

}
