//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var albumCollectionView: UICollectionView!
    
    let cellCollection = CellCollection()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        albumCollectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.cellID)
        
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.cellCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.cellID, for: indexPath) as? PhotoCell else { return UICollectionViewCell()}
        if let cellModel = cellCollection[indexPath.row] as? PhotoCellModel {
            let cellImageData = cellModel.getImage()
            cell.setImage(to: cellImageData)
        }
        return cell
    }
}
