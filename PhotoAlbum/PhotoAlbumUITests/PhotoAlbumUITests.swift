//
//  PhotoAlbumUITests.swift
//  PhotoAlbumUITests
//
//  Created by 최예주 on 2022/03/23.
//

import XCTest

class PhotoAlbumUITests: XCTestCase {
    
    private var albumCollectionView: XCUIElement!
    private var app: XCUIApplication!
    private var photoCell: XCUIElement!
    private var imageView: XCUIElement!
    
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
        albumCollectionView = app.collectionViews["AlbumCollectionView"]
        photoCell = app.cells["AlbumCollectionViewCell"]
        imageView = app.images["photoCellImageView"]
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // 셀 테스트
    
    
    // 이미지 셋팅 테스트
    
    func testImageView() throws {
               
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
