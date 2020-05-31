//
//  CollectionViewCell.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 28.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit
import SDWebImage

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
    
    var videoIcon: UIImageView = {
        let videoIcon = UIImageView()

        videoIcon.image = UIImage(named: "iconfinder_video_camera_172629")
        videoIcon.contentMode = .scaleAspectFit
        return videoIcon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        videoIcon.frame = CGRect(x: (self.frame.width/2) - 25, y: (self.frame.height/2) - 25, width: 50, height: 50)
        self.photoOfCell.addSubview(videoIcon)
        self.addSubview(photoOfCell)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(photo: Photos) {
        
        if photo.photoInfo?.photo?.media == "video" {
            videoIcon.isHidden = false
        } else {
            videoIcon.isHidden = true
        }
        
        photoOfCell.sd_setImage(with: URL(string: photo.url), completed: nil)
    }

}
