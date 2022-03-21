//
//  ColorCell.swift
//  PhotoAlbum
//
//  Created by 최예주 on 2022/03/21.
//

import Foundation

class ColorCell: Cellable {
    
    private var color: Color
    
    init() {
        color = Color.random()
    }
    
    func getColor() -> Color {
        return self.color
    }
}
