//
//  InputTextView.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 05/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

class InputFieldView: UIView
{
    // MARK - Initializers
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
        //icon
        addSubview(iconView)
        iconView.positionAnchor(leading: leadingAnchor, leadingMargin: 8, bottom: bottomAnchor, bottomMargin: 8)
        
        //text
        addSubview(textView)
        textView.positionAnchor(leading: iconView.trailingAnchor, leadingMargin: 8, trailing: trailingAnchor, trailingMargin: 8, bottom: bottomAnchor, bottomMargin: 8)
        
        //line
        addSubview(lineView)
        lineView.positionAnchor(leading: leadingAnchor, leadingMargin: 8, trailing: trailingAnchor, trailingMargin: 8, bottom: bottomAnchor, bottomMargin: 0)
    }
    
    
    // MARK: - Value
    var inputValue:String {
        textView.text ?? ""
    }
    
    // MARK: - Icon
    let iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.sizeAnchor(width: 24, height: 24)
        view.tintColor = .white
        return view
    }()
    
    
    // MARK: - Text
    let textView: UITextField = {
        let view = UITextField()
        view.textColor = .white
        return view
    }()
    
    
    // MARK: - Line
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.sizeAnchor(height: 1)
        return view
    }()
}
