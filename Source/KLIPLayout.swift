//
//  KLIPLayout.swift
//  YPImagePicker
//
//  Created by royliu1990 on 2018/3/19.
//  Copyright © 2018年 Yummypets. All rights reserved.
//

import UIKit
struct KLIPLayout {
    
    struct common {
        static let backgroundColor:UIColor = .black
        static let fontColor:UIColor = .white
        static let font:UIFont = UIFont(name: "Ubuntu-Medium", size: 15)!
        static let titleFont:UIFont = UIFont(name: "Ubuntu-Medium", size: 17)!
        static let cancelText:String = "Cancel"
    }
    
    struct libraryList {
        
        static let fontColor:UIColor = UIColor.black
        
        static let rowHeight:CGFloat = 90
        
        static let thumbnilLeft:CGFloat = 15
        static let thumbnilTop:CGFloat = 15
        static let thumbnilSize:CGFloat = 60
        
//        static let nameFont:UIFont = UIFont(name: "Ubuntu-Medium", size: 15)!
        static let nameFont:UIFont = UIFont.systemFont(ofSize: 15)

        static let nameColor:UIColor = UIColor.black
        static let nameLeft:CGFloat = 15
        
        static let placeHolder:UIImage = UIImage()
    }
    
    struct toolbar {
//        static let font:UIFont = UIFont(name: "Ubuntu-Medium", size: 15)!
        static let font:UIFont = UIFont.systemFont(ofSize: 15)
    }
    
    struct navibar {
        static let nextBarColor:UIColor = .red
        static let fontColor:UIColor = .red
        static let arrowImg:UIImage = UIImage()
    }
    
    struct photo {
        static let buttonImage:UIImage = imageFromBundle("拍照-小圈")
        static let flashOnImage:UIImage = imageFromBundle("闪光灯-打开")
        static let flashOffImage:UIImage = imageFromBundle("闪光灯-关闭")
        static let flashAutoImage:UIImage = imageFromBundle("闪光灯-自动")
        static let flipImage:UIImage = imageFromBundle("翻转")
        static let flashMargin:CGFloat = 15
    }
    
    struct video {
        static let buttonImage:UIImage = imageFromBundle("拍摄视频-小圈")
    }
}

