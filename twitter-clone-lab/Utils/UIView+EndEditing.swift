//
//  UIView+TapEndEditing.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 06/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

extension UIView
{
    func addEndEditingOnTap()
    {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing)))
    }
}
