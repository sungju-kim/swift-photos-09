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
    
//    static func makePhotoCell(image: PHFetchResult<PHAssetCollection> ) -> [Cellable] {
//        var cells : [Cellable] = []
//        for i in 0..<image.count {
//            let imageData = image[i]
//            cells.append(PhotoCellModel(image: <#T##Data#>))
//        }
//        return cells
//    }
}
