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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.requestPhoto()
        makePhotoCell()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        albumCollectionView.register(PhotoCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.cellID)
        albumCollectionView.reloadData()
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        
       
        albumCollectionView.reloadData()
        
        
        
        
    }
    
    func makePhotoCell() {
        for i in 0..<fetchResult!.count {
            let asset: PHAsset = (fetchResult?.object(at: i))!
            imageManager.requestImageDataAndOrientation(for: asset, options: nil) { data, _, _, _ in
                if let data = data {
                    let newCell = PhotoCellModel(image: data)
                    self.cellCollection.addCell(with: newCell)
                }
            }
        }
        
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
        if let imageData = cellModel?.getImage() {
            cell.setImage(to: UIImage(data: imageData))
        }
        
//        imageManager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options:nil) { img, _ in
//
//            cell.setImage(to: img)
//        }
        
        return cell
    }
}
