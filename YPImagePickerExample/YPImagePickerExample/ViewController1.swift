//
//  ViewController1.swift
//  YPImagePicker
//
//  Created by royliu1990 on 2018/3/26.
//  Copyright © 2018年 Yummypets. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    let img = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(img)
        
        img.frame = view.bounds
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
