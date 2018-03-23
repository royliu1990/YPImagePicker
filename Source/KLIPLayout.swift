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
        static let backgroundColor:UIColor = UIColor.withHex(hexString:"181818", alpha:1)
        static let fontColor:UIColor = .white
        static let font:UIFont = UIFont(name: "Ubuntu-Medium", size: 15)!
        static let titleFont:UIFont = UIFont(name: "Ubuntu-Medium", size: 17)!
        static let cancelText:String = ypLocalized("Cancel")
        static let mainRed:UIColor = UIColor.withHex(hexInt: 0xeb2135, alpha: 1)

    }
    
    struct libraryList {
        
        static let fontColor:UIColor = UIColor.withHex(hexString:"181818", alpha:1)
        
        static let rowHeight:CGFloat = 90
        
        static let thumbnilLeft:CGFloat = 15
        static let thumbnilTop:CGFloat = 15
        static let thumbnilSize:CGFloat = 60
        
        static let nameFont:UIFont = UIFont(name: "Ubuntu-Medium", size: 15)!

        static let nameLeft:CGFloat = 15
        
        static let placeHolder:UIImage = UIImage()
    }
    
    struct toolbar {
//        static let font:UIFont = UIFont(name: "Ubuntu-Medium", size: 15)!
        static let font:UIFont = UIFont(name: "Ubuntu-Medium", size: 14)!

//        static let font:UIFont = UIFont.systemFont(ofSize: 15)
    }
    
    
    
    struct navibar {
        static let nextBarColor:UIColor = UIColor.withHex(hexInt: 0xeb2135, alpha: 1)
        static let fontColor:UIColor = UIColor.withHex(hexInt: 0xeb2135, alpha: 1)
        static let arrowImg:UIImage = UIImage()
        static let titleFont:UIFont = UIFont(name: "Ubuntu-Medium", size: 17)!
        static let itemFont:UIFont = UIFont(name: "Ubuntu-Medium", size: 15)!
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
        static let eplaseTime:UIFont = UIFont(name: "DINPro-Bold", size: 14)!

    }
    
    struct filter {
        static let filterNameFont:UIFont = UIFont(name: "Ubuntu-Medium", size: 12)!
        
    }
}

