//
//  PhotoCellModel.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/22.
//

import Foundation

class PhotoCellModel: Cellable {
    private(set) var image: Data
    
    init(image: Data) {
        self.image = image
    }
    
    func getImage() -> Data {
        return self.image
    }
}
