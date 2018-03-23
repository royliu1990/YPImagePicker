//
//  YPFiltersVC.swift
//  photoTaking
//
//  Created by Sacha Durand Saint Omer on 21/10/16.
//  Copyright © 2016 octopepper. All rights reserved.
//

import UIKit

class YPFiltersVC: UIViewController {
    
    override var prefersStatusBarHidden: Bool { return configuration.hidesStatusBar }
    
    internal let configuration: YPImagePickerConfiguration!
    var v = YPFiltersView()
    var filterPreviews = [YPFilterPreview]()
    var filters = [YPFilter]()
    var originalImage = UIImage()
    var thumbImage = UIImage()
    var didSelectImage: ((UIImage, Bool) -> Void)?
    var isImageFiltered = false
    
    override func loadView() { view = v }
    
    required init(image: UIImage, configuration: YPImagePickerConfiguration) {
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
        title = configuration.wordings.filter
        navigationController?.navigationBar.barTintColor = .white
        self.originalImage = image
        
        filterPreviews = [
            YPFilterPreview("Normal"),
            YPFilterPreview("Mono"),
            YPFilterPreview("Tonal"),
            YPFilterPreview("Noir"),
            YPFilterPreview("Fade"),
            YPFilterPreview("Chrome"),
            YPFilterPreview("Process"),
            YPFilterPreview("Transfer"),
            YPFilterPreview("Instant"),
            YPFilterPreview("Sepia")
        ]
        
        let filterNames = [
            "",
            "CIPhotoEffectMono",
            "CIPhotoEffectTonal",
            "CIPhotoEffectNoir",
            "CIPhotoEffectFade",
            "CIPhotoEffectChrome",
            "CIPhotoEffectProcess",
            "CIPhotoEffectTransfer",
            "CIPhotoEffectInstant",
            "CISepiaTone"
        ]
        
        for fn in filterNames {
            filters.append(YPFilter(fn))
        }
    }
    
    func thumbFromImage(_ img: UIImage) -> UIImage {
        let width: CGFloat = img.size.width / 5
        let height: CGFloat = img.size.height / 5
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        img.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let smallImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return smallImage!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        v.imageView.image = originalImage
        thumbImage = thumbFromImage(originalImage)
        v.collectionView.register(YPFilterCollectionViewCell.self, forCellWithReuseIdentifier: "FilterCell")
        v.collectionView.dataSource = self
        v.collectionView.delegate = self
        v.collectionView.selectItem(at: IndexPath(row: 0, section: 0),
                                                  animated: false,
                                                  scrollPosition: UICollectionViewScrollPosition.bottom)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Complete", style: .plain, target: self, action: #selector(done))

        
        v.collectionView.layer.shadowColor = UIColor.black.cgColor
        
        v.collectionView.layer.shadowRadius = 7
        
        v.collectionView.layer.shadowOffset = CGSize(width: 0, height: 7)
       
        v.collectionView.layer.shadowOpacity = 0.2
        
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageFromBundle("whiteBack"), style: .plain, target: self, action: #selector(back))
        
        navigationItem.rightBarButtonItem?.tintColor = KLIPLayout.common.mainRed
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.font:KLIPLayout.common.font], for: .normal)
        
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.font:KLIPLayout.common.font], for: .normal)
    }
    
    @objc
    func done() {
        didSelectImage?(v.imageView.image!, isImageFiltered)
    }
    
    @objc
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        
        let label = UILabel()
        label.text = self.title!.uppercased()
        label.textColor = .white
        label.font = KLIPLayout.navibar.titleFont
        label.textAlignment = .center
        titleView.addSubview(label)
        
//        titleView.sv(
//            label,
//            arrow,
//            button
//        )
//
//        |-(>=8)-label.centerInContainer()-(>=8)-|
        
        label.frame = titleView.bounds
        
        navigationItem.titleView = titleView
       
    }
}

extension YPFiltersVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterPreviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let filterPreview = filterPreviews[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell",
                                                         for: indexPath) as? YPFilterCollectionViewCell {
            cell.name.text = filterPreview.name
            
            cell.name.font = KLIPLayout.filter.filterNameFont
            if let img = filterPreview.image {
                cell.imageView.image = img
            } else {
                let filter = self.filters[indexPath.row]
                let filteredImage = filter.filter(self.thumbImage)
                cell.imageView.image = filteredImage
                filterPreview.image = filteredImage // Cache
            }
            return cell
        }
        return UICollectionViewCell()
    }
}

extension YPFiltersVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedFilter = filters[indexPath.row]
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            let filteredImage = selectedFilter.filter(self.originalImage)
            DispatchQueue.main.async {
                self.v.imageView.image = filteredImage
            }
        }
        
        if selectedFilter.name != "" {
            self.isImageFiltered = true
        }
    }
}
