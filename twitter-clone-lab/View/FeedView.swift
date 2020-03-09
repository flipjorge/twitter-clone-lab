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
    
    let logo: UIImageView = {
        let view = UIImageView(image: UIImage(named: "twitter-480"))
        view.contentMode = .scaleAspectFit
        return view
    }()
}
