//
//  FeedView.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 09/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class FeedView: UIView
{
    // MARK: - Lifecycle
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        setupViews()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupViews()
    }
    
    
    // MARK: - Setup Views
    func setupViews()
    {
        //background
        backgroundColor = UIColor.appTheme.white.rgb
        //
    }
    
    
    // MARK: - Logo
    let logo: UIImageView = {
        let view = UIImageView(image: UIImage(named: "twitter-480"))
        view.contentMode = .scaleAspectFit
        view.sizeAnchor(width: 44, height: 44)
        return view
    }()
    
    
    // MARK: - User Picture
    let userPictureImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 32 / 2
        view.layer.masksToBounds = true
        view.sizeAnchor(width: 32, height: 32)
        return view
    }()
    
    lazy var userPictureButton: UIBarButtonItem = {
        let view = UIBarButtonItem(customView: userPictureImage)
        return view
    }()
    
    func showUserPicture(animated: Bool = true)
    {
        if animated {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: .curveEaseInOut, animations: { [weak self] in
                self?.userPictureImage.center.y = 22
                self?.userPictureImage.transform = CGAffineTransform(rotationAngle:0)
            })
        } else {
            userPictureImage.center.y = 22
            userPictureImage.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
    
    func hideUserPicture(animated: Bool = true)
    {
        if animated {
            UIView.animate(withDuration: 1) { [weak self] in
                self?.userPictureImage.center.y = -44
                self?.userPictureImage.transform = CGAffineTransform(rotationAngle: 90)
            }
        } else {
            userPictureImage.center.y = -44
            userPictureImage.transform = CGAffineTransform(rotationAngle: 90)
        }
    }
}
