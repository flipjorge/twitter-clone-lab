//
//  UIColor+AppTheme.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 04/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

extension UIColor
{
    enum appTheme {
        case blue, black, darkGray, lightGray, extraLightGray, extraExtraLightGray, white
        
        var rgb: UIColor
        {
            switch self
            {
            case .blue:
                return UIColor.rgb(red: 29, green: 161, blue: 242)
            case .black:
                return UIColor.rgb(red: 20, green: 23, blue: 26)
            case .darkGray:
                return UIColor.rgb(red: 101, green: 119, blue: 134)
            case .lightGray:
                return UIColor.rgb(red: 170, green: 184, blue: 194)
            case .extraLightGray:
                return UIColor.rgb(red: 225, green: 232, blue: 237)
            case .extraExtraLightGray:
                return UIColor.rgb(red: 245, green: 248, blue: 250)
            case .white:
                return UIColor.rgb(red: 255, green: 255, blue: 255)
            }
        }
    }
}
