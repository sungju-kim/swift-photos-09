//
//  Color.swift
//  PhotoAlbum
//
//  Created by 최예주 on 2022/03/21.
//

import Foundation

class Color{
    
    private var red: UInt8
    private var green: UInt8
    private var blue: UInt8
    
    
    
    init(red: UInt8, green: UInt8, blue: UInt8) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    static func random() -> Color {
        
        var randomColor: UInt8{
            UInt8(Int.random(in: 0...255))
        }
        return Color(red: randomColor, green: randomColor, blue: randomColor)
    }
    
    
    
    
}
