//
//  ImageDownloader.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/25.
//

import Foundation

class ImageDownloader {
    static func download(from imageData:[URLImage]) -> [String:Data] {
        var data : [String:Data] = [:]
        let group = DispatchGroup()
        for imageDatum in imageData {
            group.enter()
            DispatchQueue.global().async {
                if let datum = try? Data(contentsOf: imageDatum.image){
                    data[imageDatum.title] = datum
                }
                group.leave()
            }
        }
        group.wait()
        return data
    }
}
