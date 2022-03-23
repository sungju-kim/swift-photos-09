//
//  File.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/22.
//

import Foundation
import UIKit

protocol PhotoSetable {
    var imageView : UIImageView { get }
    
    func setImage(to image: Data)
}
