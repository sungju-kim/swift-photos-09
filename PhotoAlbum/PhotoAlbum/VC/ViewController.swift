//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var albumCollectionView: UICollectionView!
    
    private let cellCollection = CellCollection()
    private var photoManager = PhotoManager()
    private var jsonManager = JsonManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumCollectionView.register(PhotoCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.cellID)
        
        photoManager.delegate = self
        jsonManager.delegate = self 
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        albumCollectionView.reloadData()
        photoManager.loadPhotoLibrary()
        
        jsonManager.load()
        
        
        
    }
    
    func makeCell(count: Int) {
        let newCells = CellModelFactory.makeColorCells(count: count)
        cellCollection.addCells(with: newCells)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, PhotoManagerDelegate {
    func photoManager(didLoad data: [Data]) {
        let assets = data
        let count = assets.count
        let cells = CellModelFactory.makePhotoCell(with: assets, count: count)
        cellCollection.addCells(with: cells)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.cellID, for: indexPath) as? PhotoCell else { return UICollectionViewCell()}
        
        let cellModel = cellCollection[indexPath.row] as? PhotoCellModel
        if let asset = cellModel?.getImage() {
            let image = UIImage(data: asset) ?? UIImage()
            cell.setImage(to: image)
        }
        return cell
    }
}

extension ViewController: JsonManagerDelegate {
    func jsonManager(didLoad data: [URLImage]) {
        
        
    }

}
