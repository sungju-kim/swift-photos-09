//
//  ImageDownloader.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/25.
//

import Foundation

class ImageDownloader {
    static func download(from imageData:[URLImage]) -> [Data] {
        var data : [Data] = []
        for imageDatum in imageData {
            guard let datum = try? Data(contentsOf: imageDatum.image) else {continue}
            data.append(datum)
        }
        return data
    }
}
