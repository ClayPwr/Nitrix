//
//  FullScreenImageViewController.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 29.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit
import SnapKit

class FullScreenImageViewController: UIViewController {
    
    var imageUrl: Photos?
    let setImage = SetImage()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubView()
        addConstraint()
        addImage()
        
    }
    
    func addSubView(){
        self.view.addSubview(imageView)
    }
    
    func addConstraint(){
        imageView.snp.makeConstraints { (make) in
            
            make.left.right.bottom.top.equalToSuperview()
        }
    }
    
    func addImage(){
        if let url = imageUrl {
            if let imageUrl = setImage.setImage(from: url){
                guard let urlStr = URL(string: imageUrl) else { return }
                DispatchQueue.global().async {
                    guard let data = try? Data(contentsOf: urlStr) else { return }
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                        
                    }
                }
            }
        }
    }
    
}
