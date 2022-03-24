//
//  Photocell.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/22.
//

import Foundation
import UIKit

class PhotoCell: AlbumCollectionViewCell, PhotoSetable {
    private(set) var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.accessibilityIdentifier = "photoCellImageView"
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        self.accessibilityIdentifier = "AlbumCollectionViewCell"
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layout()
        self.accessibilityIdentifier = "AlbumCollectionViewCell"
    }
    
    func setImage(to image: UIImage) {
        self.imageView.image = image
    }
    
    private func layout() {
        self.addSubview(imageView)
        self.imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.imageView.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
}
