//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by dale on 2022/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var albumCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        albumCollectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.cellID)
        
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.cellID, for: indexPath) as? AlbumCollectionViewCell else { return UICollectionViewCell()}
        
        
        return cell
    }
    
    
    
    
    
}
