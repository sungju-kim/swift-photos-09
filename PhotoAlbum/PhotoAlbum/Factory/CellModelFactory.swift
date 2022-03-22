//
//  CellFactory.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/21.
//

import Foundation

struct CellModelFactory {
    static func makeColorCells(count: Int) -> [Cellable] {
        var cells : [Cellable] = []
        for _ in 0..<count {
            cells.append(ColorCellModel())
        }
        return cells
    }
}
