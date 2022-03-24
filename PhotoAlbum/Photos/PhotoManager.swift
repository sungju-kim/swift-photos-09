//
//  PhotoResult.swift
//  PhotoAlbum
//
//  Created by 최예주 on 2022/03/24.
//

import Foundation
import Photos
import UIKit

class PhotoManager: NSObject, PHPhotoLibraryChangeObserver{
    
    private var fetchResult: PHFetchResult<PHAsset>?
    private let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    
    override init() {
        super.init()
        PHPhotoLibrary.shared().register(self)
    }
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
    }
    
    private func fetchPhotosData(){
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        guard let cameraRollCollection = cameraRoll.firstObject else { return }
        
        let allPhotosOptions = PHFetchOptions()
        allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: allPhotosOptions)
    }
    
    private func convertToData(with asset: PHAsset) -> Data {
        var convertedData: Data = Data()
        let requestOption = PHImageRequestOptions()
        requestOption.isSynchronous = true
        
        self.imageManager.requestImageDataAndOrientation(for: asset, options: requestOption) { data, _, _, _ in
            guard let imageData = data else { return }
            convertedData = imageData
        }
        
        return convertedData
    }
    
    func loadPhotoLibrary() -> [Data] {
        var data: [Data] = []
        fetchPhotosData()
        if let fetchResult = fetchResult {
            for asset in 0..<fetchResult.count{
                data.append(convertToData(with: fetchResult.object(at: asset)))
            }
        }
        return data
    }
    
    
}
