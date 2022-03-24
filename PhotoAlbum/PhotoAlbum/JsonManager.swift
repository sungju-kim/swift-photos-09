//
//  JsonManager.swift
//  PhotoAlbum
//
//  Created by 최예주 on 2022/03/24.
//

import Foundation


struct JsonManager {
    
    func load() {
        let fileName = "doodle"
        let type = "json"
        
        guard let fileLocation = Bundle.main.url(forResource: fileName, withExtension: type) else { return  }
        
        do {
            let data = try Data(contentsOf: fileLocation)
            decode(to: data)

        } catch {
        }
    }
    
    private func decode(to data: Data) {
        let photoList = try? JSONDecoder().decode([URLImage].self, from: data)
    }
    
}
