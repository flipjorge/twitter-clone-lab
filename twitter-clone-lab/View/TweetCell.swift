//
//  TweetCell.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 14/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell
{
    // MARK: - Lifecycle
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }
}
