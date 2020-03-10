//
//  UIImageView+Load.swift
//  twitter-clone-lab
//
//  Created by Filipe Jorge on 10/03/2020.
//  Copyright © 2020 Filipe Jorge. All rights reserved.
//

import UIKit

extension UIImageView
{
    func load(from url: URL, completion: (() -> Void)? = nil)
    {
        DispatchQueue.global().async { [weak self] in
            
            do{
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    self?.image = image
                    if let completion = completion { completion() }
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
 
