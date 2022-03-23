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
        
        albumCollectionView.register(PhotoCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.cellID)
        albumCollectionView.reloadData()
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        
        albumCollectionView.reloadData()
        
        self.requestPhoto()
        makePhotoCell()
    }
    
    func makePhotoCell() {
        guard let assets = self.fetchResult else {return}
        let count = assets.count
        let cells = CellModelFactory.makePhotoCell(with: assets, count: count)
        cellCollection.addCells(with: cells)
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
        return cellCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.cellID, for: indexPath) as? PhotoCell else { return UICollectionViewCell()}
        let cellModel = cellCollection[indexPath.row] as? PhotoCellModel
        if let asset = cellModel?.getImage() {
            imageManager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options:nil) { img, _ in
                cell.setImage(to: img)
            }
        }
        return cell
    }
}
