//
//  ColorCell.swift
//  PhotoAlbum
//
//  Created by 최예주 on 2022/03/21.
//

import Foundation
import CoreGraphics

class ColorCellModel: Cellable {
    
    private(set) var color: CGColor
    
    init() {
        color = CGColor.random()
    }
    
    func getColor() -> CGColor {
        return self.color
    }
}

extension ColorCellModel: Equatable {
    static func == (lhs: ColorCellModel, rhs: ColorCellModel) -> Bool {
        return lhs === rhs
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
