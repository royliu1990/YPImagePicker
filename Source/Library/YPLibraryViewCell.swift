//
//  YPLibraryViewCell.swift
//  YPImgePicker
//
//  Created by Sacha Durand Saint Omer on 2015/11/14.
//  Copyright © 2015 Yummypets. All rights reserved.
//

import UIKit
import Stevia

class YPLibraryViewCell: UICollectionViewCell {
    
    var representedAssetIdentifier: String!
    let imageView = UIImageView()
    let durationLabel = UILabel()
    let selectionOverlay = UIView()
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sv(
            imageView,
            durationLabel,
            selectionOverlay
        )

        imageView.fillContainer()
        selectionOverlay.fillContainer()
        layout(
            durationLabel-5-|,
            5
        )
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        durationLabel.textColor = .white
        durationLabel.font = KLIPLayout.filter.filterNameFont
        durationLabel.isHidden = true
        
        durationLabel.layer.shadowColor = UIColor.black.cgColor
        
        durationLabel.layer.shadowRadius = 2
        
        durationLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        durationLabel.layer.shadowOpacity = 0.3
        
        selectionOverlay.backgroundColor = .black
        selectionOverlay.alpha = 0
        backgroundColor = .white
    }

    override var isSelected: Bool {
        didSet { isHighlighted = isSelected }
    }
    
    override var isHighlighted: Bool {
        didSet {
            selectionOverlay.alpha = isHighlighted ? 0.5 : 0
        }
    }
}
