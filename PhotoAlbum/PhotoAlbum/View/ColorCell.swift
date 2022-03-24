//
//  ColorCell.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/22.
//

import Foundation
import UIKit

class ColorCell: AlbumCollectionViewCell, ColorChangeable {
    
    func changeColor(to color: UIColor) {
        self.backgroundColor = color
    }
}
