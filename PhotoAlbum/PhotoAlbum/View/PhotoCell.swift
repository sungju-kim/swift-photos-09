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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setImage(to image: UIImage?) {
//        let image = UIImage(data: image)
        guard let image = image else {return }
        self.imageView.image = image
    }
    
    private func layout() {
        self.addSubview(imageView)
        self.imageView.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor).isActive = true
        self.imageView.topAnchor.constraint(equalTo: self.imageView.topAnchor).isActive = true
        self.imageView.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor).isActive = true
        self.clipsToBounds = true
    }
}
