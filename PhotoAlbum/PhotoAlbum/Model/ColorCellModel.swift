//
//  ColorCell.swift
//  PhotoAlbum
//
//  Created by 최예주 on 2022/03/21.
//

import Foundation
import CoreGraphics

class ColorCellModel: Cellable {
    
    private var color: CGColor
    
    init() {
        color = CGColor.random()
    }
    
    func getColor() -> CGColor {
        return self.color
    }
}


extension CGColor{

    static func random() -> CGColor {
        
        var randomColor: CGFloat{
            CGFloat.random(in: 0...1.0)
        }
        return CGColor(red: randomColor, green: randomColor, blue: randomColor, alpha: 1)
    }
}
