//
//  TableViewCell.swift
//  Nitrix
//
//  Created by Tarabanov Igor on 27.05.2020.
//  Copyright © 2020 Tarabanov Igor. All rights reserved.
//

import UIKit


public class TableViewCell: UITableViewCell {
    
    static let tableViewCell = "Cell"
    
    lazy var photoSetLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    lazy var numberItemsLabel: UILabel = {
           let label = UILabel()
           label.textColor = .gray
           label.alpha = 0.8
           label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
           label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
           return label
       }()
    lazy var viewsLabel: UILabel = {
           let label = UILabel()
           label.textColor = .gray
           label.alpha = 0.8
           label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
           label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
           return label
    }()
    lazy var commentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.alpha = 0.8
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    var imageViewContent: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 25
        return image
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(commentsLabel)
        self.addSubview(photoSetLabel)
        self.addSubview(numberItemsLabel)
        self.addSubview(viewsLabel)
        self.addSubview(imageViewContent)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(from: PhotoTableCellModel) {
        commentsLabel.text = from.countComment
        photoSetLabel.text = from.titleContent
        numberItemsLabel.text = from.countPhoto
        viewsLabel.text = from.countViews
        guard let url = URL(string: from.url) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.imageViewContent.image = UIImage(data: data)
            }
        }
    }
    
}
