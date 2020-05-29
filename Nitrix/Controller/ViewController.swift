//
//  ViewController.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 27.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    let dataFetcherService = DataFetcherService()
    
    var photoSets:[PhotoSet] = []
    
    var photoTableCell: [PhotoTableCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Albums"
        
        addSubView()
        runSnapkitAuthLayout()
        
        
        dataFetcherService.fetchPhotoSet { (photosets) in
            if let photos = photosets?.photosets?.photoset {
                self.photoSets = photos.map{ $0 }
                self.tableView.reloadData()

                let photos = photos.map({ PhotoTableCellModel(photoSet: $0)})
                self.photoTableCell = photos

            }
        }
    }
    

    
//    func configureURLImage(photo: [PhotoSet]) -> [String] {
//        var imageUrls: [String] = []
//        //let i = "https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg"
//        let defaultUrl = "https://farm2.staticflickr.com/1635/24890560159_e9b30b4335_m.jpg"
//        let urlString = "https://farm"
//        for value in photo {
//            let farm = String(value.farm)
//            let server = value.server
//            let primary = value.primary
//            let secret = value.secret
//            if !farm.isEmpty && !server.isEmpty && !primary.isEmpty && !secret.isEmpty {
//               let url = urlString.appending(farm + ".").appending("staticflickr.com/").appending(server + "/").appending(primary + "_").appending(secret + "_m.jpg")
////                return url
//                imageUrls.append(url)
//            }else {
////                return defaultUrl
//                imageUrls.append(defaultUrl)
//            }
//
//        }
//        return imageUrls
//    }
    

    
    
    func addSubView() {
        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.tableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func runSnapkitAuthLayout(){
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.right.left.bottom.equalTo(view)
            
        }
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photoSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let photoCell = photoTableCell[indexPath.row]
//        let photoSet = photoSets[indexPath.row]
//        let photoSetImage = imageUrls[indexPath.row]
        cell.configureCell(from: photoCell)
        
        
        cell.photoSetLabel.snp.makeConstraints { (make) in
            make.width.equalTo(cell.frame.width / 2)
            make.top.equalTo(10)
            make.left.equalTo(70)
        }
        
        cell.commentsLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.right.equalTo(-20)
        }
        
        cell.numberItemsLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.left.equalTo(180)
        }
        
        cell.viewsLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.left.equalTo(70)
            
        }
        
        cell.imageViewContent.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.bottom.equalTo(-10)
            make.left.equalTo(10)
        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "Segue", sender: nil)
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let albumContent = photoTableCell[indexPath.row]
        let collectionView = segue.destination as! CollectionViewController
        collectionView.album = albumContent
    }
    
}