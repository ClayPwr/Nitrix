//
//  CollectionViewController.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 28.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class CollectionViewController: UIViewController {
    

    var album: PhotoTableCellModel?
    var photos: [Photos] = []
    
    let dataFetcherService = DataFetcherService()
    
    
    lazy var collectionView: UICollectionView = {
        var flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .vertical
        //Задает расстояние строк между ячейками колекции
        flowLayout.minimumLineSpacing = 30
        collectionView.contentInset = UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20)
        collectionView.backgroundColor = .white

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = album?.titleContent
        
        addSubView()
        runSnapkitAuthLayout()
        collectionView.reloadData()
        
        let userId =  album?.userId ?? "22365685@N03"
        let albumId = album?.albumId ?? "72157665095947795"
        
        dataFetcherService.fetchAlbum(urlPartUserId: userId, urlPartAlbumId: albumId) { (album) in
            
            if let albums = album?.photoset?.photo {
                let photos = albums.map{ $0 }
                self.photos = photos
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrientation([.landscape, .portrait])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        AppUtility.lockOrientation(.portrait)
    }
    
    func addSubView() {
        view.addSubview(collectionView)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.collectionViewCell)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func runSnapkitAuthLayout(){
        
        collectionView.snp.makeConstraints { (make) in

            make.left.right.bottom.top.equalToSuperview()
 
        }
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.collectionViewCell, for: indexPath) as! CollectionViewCell

        cell.configure(from: photos[indexPath.row])
        
        cell.photoOfCell.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalToSuperview()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCellPortrait = (self.view.frame.width / 2) - 30
        let heightCellPortrait = (self.view.frame.height / 3) - 60
        let widthCellLandScape = (self.view.frame.width / 3) - 60
        let heightCellLandScape = (self.view.frame.height / 2) - 30
        let orient =  UIDevice.current.value(forKey: "orientation") as? Int
        if let orientation = orient {
            if orientation == 0 || orient == 1 {
                return CGSize(width: widthCellPortrait, height: heightCellPortrait)
            }else if orientation == 3 || orientation == 4 {
                return CGSize(width: widthCellLandScape, height: heightCellLandScape)
            }
            
        }
        return CGSize(width: widthCellPortrait, height: heightCellPortrait)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowImage", sender: nil)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        let photo = photos[indexPath.row]
        let ImageVC = segue.destination as! FullScreenImageViewController
        ImageVC.imageUrl = photo
    }
}
