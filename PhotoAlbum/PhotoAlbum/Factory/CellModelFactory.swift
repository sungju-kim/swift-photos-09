//
//  CellFactory.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/21.
//

import Foundation
import Photos
struct CellModelFactory {
    static func makeColorCells(count: Int) -> [Cellable] {
        var cells : [Cellable] = []
        for _ in 0..<count {
            cells.append(ColorCellModel())
        }
        return cells
    }
    
    static func makePhotoCell(with image: PHFetchResult<PHAsset>, count: Int ) -> [Cellable] {
        var cells : [Cellable] = []
        for i in 0..<count {
            let asset: PHAsset = image.object(at: i)
            let newCell = PhotoCellModel(image: asset)
            cells.append(newCell)
        }
        return cells
    }
}
