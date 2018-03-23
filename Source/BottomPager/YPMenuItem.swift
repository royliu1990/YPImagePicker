//
//  YPMenuItem.swift
//  YPImagePicker
//
//  Created by Sacha DSO on 24/01/2018.
//  Copyright © 2016 Yummypets. All rights reserved.
//

import UIKit
import Stevia

final class YPMenuItem: UIView {
    
    var text = UILabel()
    var button = UIButton()
    
    var redBar = UIView()
    
    convenience init() {
        self.init(frame: .zero)
        backgroundColor = .clear
        
        sv(
            text,
            button,
            redBar
        )
        
        text.centerInContainer()
        button.fillContainer()
        redBar.backgroundColor = .red
        text.style { l in
            l.textAlignment = .center
            l.font = KLIPLayout.toolbar.font
            l.textColor = self.unselectedColor()
        }
        
        redBar.bottom(2)
        redBar.centerHorizontally()
        redBar.width(12)
        redBar.height(2)
        
        
      
    }
    
    func selectedColor() -> UIColor {
        return .white
    }
    
    func unselectedColor() -> UIColor {
        return UIColor.withHex(hexInt: 0xffffff, alpha: 0.5)
    }
    
    func select() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.redBar.alpha = 1
        })
        text.textColor = selectedColor()
    }
    
    func unselect() {
        
        UIView.animate(withDuration: 0.1, animations: {
            self.redBar.alpha = 0
        })
        text.textColor = unselectedColor()
    }
}

