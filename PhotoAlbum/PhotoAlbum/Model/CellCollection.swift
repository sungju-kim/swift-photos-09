//
//  CellCollection.swift
//  PhotoAlbum
//
//  Created by 최예주 on 2022/03/21.
//

import Foundation

class CellCollection{
    
    private var cells: [Cellable] = []
    
    var count : Int {
        return self.cells.count
    }
    
    subscript(index: Int) -> Cellable {
        return cells[index]
    }
    
    init() {
        
    }
    
    func addCell(with cell: Cellable) {
        self.cells.append(cell)
    }

    
}
