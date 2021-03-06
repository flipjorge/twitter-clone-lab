//
//  UIColor+ProjectColors.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 03/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

extension UIColor
{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 255) -> UIColor
    {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha/255)
    }
}
