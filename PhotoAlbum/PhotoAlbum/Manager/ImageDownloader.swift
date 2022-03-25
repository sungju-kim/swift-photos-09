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
        let group = DispatchGroup()
        let imageQueue = DispatchQueue.init(label: "imageDownload")
        imageQueue.sync {
            for imageDatum in imageData {
                group.enter()
                DispatchQueue.global().async {
                    if let datum = try? Data(contentsOf: imageDatum.image){
                        data.append(datum)
                    }
                    group.leave()
                }
            }
        }
        group.wait()
        return data
    }
}
