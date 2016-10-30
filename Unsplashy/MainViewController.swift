//
//  MainViewController.swift
//  Unsplashy
//
//  Created by Sasha Prokhorenko on 21/10/16.
//  Copyright © 2016 Sasha Prokhorenko. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
	
	@IBOutlet weak var collectionView: NSCollectionView!
  
  let dataRequest = UnsplashWebservice()

    override func viewDidLoad() {
        super.viewDidLoad()
			
			configureCollectionView()
			
      
      dataRequest.load(Photo.all){ result in
        print(result)
      }
		
    }
	
	
	// Set collectionView layout
	private func configureCollectionView() {

		let flowLayout = NSCollectionViewFlowLayout()
		flowLayout.itemSize = NSSize(width: 160.0, height: 140.0)
		flowLayout.sectionInset = EdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
		flowLayout.minimumInteritemSpacing = 20.0
		flowLayout.minimumLineSpacing = 20.0
		collectionView.collectionViewLayout = flowLayout
		
		view.wantsLayer = true
		
		collectionView.layer?.backgroundColor = NSColor.black.cgColor
	}
    
}
