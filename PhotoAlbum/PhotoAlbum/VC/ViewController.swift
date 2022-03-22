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
        
        makeCell(count: 40)
    }
    
    func makeCell(count: Int) {
        let newCells = CellModelFactory.makeColorCells(count: count)
        cellCollection.addCells(with: newCells)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.cellCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.cellID, for: indexPath) as? AlbumCollectionViewCell else { return UICollectionViewCell()}
        if let cellModel = cellCollection[indexPath.row] as? ColorCellModel {
            let cellColor = cellModel.getColor()
            let convertedColor = UIColor(cgColor: cellColor)
            cell.changeColor(to: convertedColor)
        }
        return cell
    }
}
