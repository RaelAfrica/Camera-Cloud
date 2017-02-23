//
//  MomentsVC.swift
//  Camera and Cloud
//
//  Created by Rael Kenny on 2/7/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
}

class MomentsVC: UIViewController{

    var collectionView: UICollectionView!
    let datamanager = DAO.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        setupCollectionView()
        
    }
    //initializing the collectionView
    func setupCollectionView(){
        view.addSubview(collectionView)
    }
    
}

extension MomentsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    //number of sections in collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //number of cells in the given section:
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datamanager.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! CustomCollectionViewCell
        return cell
        //cell.imageView.image = somebullshit
    }
    
}
