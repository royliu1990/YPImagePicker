//
//  YPAlbumCell.swift
//  YPImagePicker
//
//  Created by Sacha Durand Saint Omer on 20/07/2017.
//  Copyright © 2017 Yummypets. All rights reserved.
//

import UIKit
import Stevia

class YPAlbumCell: UITableViewCell {
    
    let thumbnail = UIImageView()
    let title = UILabel()
    let numberOfPhotos = UILabel()
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        let stackView = UIStackView()
        //        stackView.axis = .vertical
        //        stackView.addArrangedSubview(title)
        //        stackView.addArrangedSubview(numberOfPhotos)
        
        //        sv(
        //            thumbnail,
        //            stackView
        //        )
        
        sv(
            thumbnail,
            title
        )
        
        layout(
            KLIPLayout.libraryList.thumbnilTop,
            |-KLIPLayout.libraryList.thumbnilLeft-thumbnail.size(KLIPLayout.libraryList.thumbnilSize),
            15
        )
        
        alignHorizontally(thumbnail-KLIPLayout.libraryList.nameLeft-title)
        
        thumbnail.contentMode = .scaleAspectFill
        thumbnail.clipsToBounds = true
        
        title.font = KLIPLayout.libraryList.nameFont
        //        numberOfPhotos.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        
        let backgroundView  = UIView()
        
        backgroundView.backgroundColor = UIColor.withHex(hexInt: 0xE2E2E2, alpha: 1.0)
        
        self.selectedBackgroundView = backgroundView
    }
}
