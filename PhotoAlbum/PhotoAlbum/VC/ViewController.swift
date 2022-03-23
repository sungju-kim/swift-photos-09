//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/21.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    @IBOutlet var albumCollectionView: UICollectionView!
    var fetchResult: PHFetchResult<PHAsset>?
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    let cellCollection = CellCollection()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        albumCollectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.cellID)
        
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        
//        makeCell(count: 40)
        
//        let photoAuthState = PHPhotoLibrary.authorizationStatus()
        
        self.requestPhoto()
        albumCollectionView.reloadData()
        
        
        
        
    }
    
    func makeCell(count: Int) {
        let newCells = CellModelFactory.makeColorCells(count: count)
        cellCollection.addCells(with: newCells)
    }
    
    func requestPhoto() {
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        guard let cameraRollCollection = cameraRoll.firstObject else {return }
        
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: nil)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        return self.cellCollection.count
        return fetchResult?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.cellID, for: indexPath) as? AlbumCollectionViewCell else { return UICollectionViewCell()}
//        if let cellModel = cellCollection[indexPath.row] as? ColorCellModel {
//            let cellColor = cellModel.getColor()
//            let convertedColor = UIColor(cgColor: cellColor)
//            cell.changeColor(to: convertedColor)
//        }
        
        let asset: PHAsset = (fetchResult?.object(at: indexPath.row))!
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFill, options:nil) { img, _ in
            cell.imageView.image = img
        }
        
        return cell
    }
}
