//
//  PhotoCellModel.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/22.
//

import Foundation
import Photos

class PhotoCellModel: Cellable {
    private(set) var image: PHAsset
    
    init(image: PHAsset) {
        self.image = image
    }
    
    func getImage() -> PHAsset {
        return self.image
    }
}
