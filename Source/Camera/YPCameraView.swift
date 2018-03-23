//
//  YPCameraView.swift
//  YPImgePicker
//
//  Created by Sacha Durand Saint Omer on 2015/11/14.
//  Copyright © 2015 Yummypets. All rights reserved.
//

import UIKit
import Stevia

class YPCameraView: UIView, UIGestureRecognizerDelegate {
    
    let focusView = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
    let previewViewContainer = UIView()
    let buttonsContainer = UIView()
    let flipButton = UIButton()
    let shotButton = UIButton()
    let flashButton = UIButton()
    let timeElapsedLabel = UILabel()
    let progressBar = UIProgressView()

    convenience init(overlayView: UIView? = nil) {
        self.init(frame: .zero)
        
        
        if let overlayView = overlayView {
            // View Hierarchy
            sv(
                previewViewContainer,
                overlayView,
                progressBar,
                timeElapsedLabel,
                flashButton,
                flipButton,
                buttonsContainer.sv(
                    shotButton
                )
            )
        } else {
            // View Hierarchy
            sv(
                previewViewContainer,
                progressBar,
                timeElapsedLabel,
                flashButton,
                flipButton,
                buttonsContainer.sv(
                    shotButton
                )
            )
        }
        
        // Layout
        let isIphone4 = UIScreen.main.bounds.height == 480
        let sideMargin: CGFloat = isIphone4 ? 20 : 0
        layout(
            0,
            |-sideMargin-previewViewContainer-sideMargin-|,
            -2,
            |progressBar|,
            0,
            |buttonsContainer|,
            0
        )
        previewViewContainer.heightEqualsWidth()
        
        |-(15+sideMargin)-flashButton.size(42)
        flashButton.Bottom == previewViewContainer.Bottom - 15
        
        flipButton.size(42)-(15+sideMargin)-|
        flipButton.Bottom == previewViewContainer.Bottom - 15
        
        
        
        shotButton.centerVertically()
        shotButton.size(80).centerHorizontally()
        
        timeElapsedLabel.CenterX == previewViewContainer.CenterX
        timeElapsedLabel.Top == shotButton.Top - 35
        
        // Style
        backgroundColor = .clear
        previewViewContainer.backgroundColor = .white
        timeElapsedLabel.style { l in
            l.textColor = .white
            l.text = "00:00"
            l.isHidden = true
            l.font = KLIPLayout.video.eplaseTime
        }
        progressBar.style { p in
            p.trackTintColor = .clear
            p.tintColor = .red
        }
        let flipImage = imageFromBundle("翻转")
        let shotImage = imageFromBundle("拍照-小圈")
        flashButton.setImage(flashOffImage, for: .normal)
        flipButton.setImage(flipImage, for: .normal)
        shotButton.setImage(shotImage, for: .normal)
        shotButton.backgroundColor = .white
        shotButton.layer.cornerRadius = 40
    }
}
