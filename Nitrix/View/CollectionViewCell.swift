//
//  CollectionViewCell.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 28.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
     static let collectionViewCell = "Cell"
    
    var image: UIImage?
    
    var photoOfCell: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 25
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(photoOfCell)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(from: Photos) {
        let urlString = "https://farm"

        var url: String {
            let urlString = "https://farm"
            let farm = String(from.farm)
            let server = from.server
            let primary = from.id
            let secret = from.secret
            let url = urlString.appending(farm + ".").appending("staticflickr.com/").appending(server + "/").appending(primary + "_").appending(secret + "_m.jpg")
            return url
        }
        guard let urlStr = URL(string: url) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: urlStr) else { return }
            DispatchQueue.main.async {
                self.photoOfCell.image = UIImage(data: data)
                self.image = UIImage(data: data)
            }
        }
    }

}
