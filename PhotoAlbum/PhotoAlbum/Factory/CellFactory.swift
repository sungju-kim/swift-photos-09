//
//  CellFactory.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/21.
//

import Foundation

struct CellFactory {
    static func makeColorCell() -> Cellable {
        return ColorCell()
    }
}
