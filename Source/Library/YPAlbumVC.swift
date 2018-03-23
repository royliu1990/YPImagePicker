//
//  YPAlbumVC.swift
//  YPImagePicker
//
//  Created by Sacha Durand Saint Omer on 20/07/2017.
//  Copyright © 2017 Yummypets. All rights reserved.
//

import UIKit
import Stevia
import Photos

class YPAlbumVC: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
         return configuration.hidesStatusBar
    }
    
    var didSelectAlbum: ((YPAlbum) -> Void)?
    var albums = [YPAlbum]()
    var noVideos = false
    let albumsManager = YPAlbumsManager.default
    
    let v = YPAlbumView()
    override func loadView() { view = v }
    
    private let configuration: YPImagePickerConfiguration!
    required init(configuration: YPImagePickerConfiguration) {
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
        title = configuration.wordings.libraryTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(close))
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(close))
        navigationItem.leftBarButtonItem?.tintColor = KLIPLayout.common.backgroundColor
        
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedStringKey.font:KLIPLayout.common.font], for: .normal)
        
        
        setUpTableView()
        albumsManager.noVideos = noVideos
        fetchAlbumsInBackground()
        
        
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    func fetchAlbumsInBackground() {
        v.spinner.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.albums = self?.albumsManager.fetchAlbums() ?? []
            DispatchQueue.main.async {
                self?.v.spinner.stopAnimating()
                self?.v.tableView.isHidden = false
                self?.v.tableView.reloadData()
            }
        }
    }
    
    @objc
    func close() {
        dismiss(animated: true, completion: nil)
    }
    
    func setUpTableView() {
        v.tableView.isHidden = true
        v.tableView.dataSource = self
        v.tableView.delegate = self
        v.tableView.rowHeight = UITableViewAutomaticDimension
        v.tableView.estimatedRowHeight = KLIPLayout.libraryList.rowHeight
        v.tableView.separatorStyle = .none
        v.tableView.register(YPAlbumCell.self, forCellReuseIdentifier: "AlbumCell")
    }
}

extension YPAlbumVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = albums[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as? YPAlbumCell {
            cell.thumbnail.backgroundColor = .gray
            cell.thumbnail.image = album.thumbnail
            cell.title.text = album.title + " (\(album.numberOfPhotos))"
            cell.title.font = KLIPLayout.libraryList.nameFont
//            cell.numberOfPhotos.text = "\(album.numberOfPhotos)"
            return cell
        }
        return UITableViewCell()
    }
}

extension YPAlbumVC: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectAlbum?(albums[indexPath.row])
    }
}
