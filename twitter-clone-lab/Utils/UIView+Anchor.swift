//
//  UIView+Extensions.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 03/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

extension UIView
{
    // MARK: - Position
    
    func positionAnchor(leading: NSLayoutXAxisAnchor? = nil,
                leadingMargin: CGFloat = 0,
                top: NSLayoutYAxisAnchor? = nil,
                topMargin: CGFloat = 0,
                trailing: NSLayoutXAxisAnchor? = nil,
                trailingMargin: CGFloat = 0,
                bottom: NSLayoutYAxisAnchor? = nil,
                bottomMargin: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let leading = leading { leadingAnchor.constraint(equalTo: leading, constant: leadingMargin).isActive = true }
        if let top = top { topAnchor.constraint(equalTo: top, constant: topMargin).isActive = true }
        if let trailing = trailing { trailingAnchor.constraint(equalTo: trailing, constant: -trailingMargin).isActive = true }
        if let bottom = bottom { bottomAnchor.constraint(equalTo: bottom, constant: -bottomMargin).isActive = true }
    }
    
    
    // MARK: - Size
    func sizeAnchor(width: CGFloat? = nil,
                    height: CGFloat? = nil)
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width { widthAnchor.constraint(equalToConstant: width).isActive = true }
        if let height = height { heightAnchor.constraint(equalToConstant: height).isActive = true }
    }
    
    
    // MARK: - Center X
    func centerXAnchor(on view: UIView,
                       top: NSLayoutYAxisAnchor,
                       topMargin: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: top, constant: topMargin).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerXAnchor(on view: UIView,
                       bottom: NSLayoutYAxisAnchor,
                       bottomMargin: CGFloat = 0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        bottomAnchor.constraint(equalTo: bottom, constant: -bottomMargin).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
