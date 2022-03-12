//
//  UIImageView+Extension.swift
//  Practical_Movie
//
//  Created by Parth Patel on 12/03/22.
//

import Foundation
import SDWebImage

extension UIImageView {
    func setImage(_ urlString:String) {
        if let url = URL(string: urlString) {
            self.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.sd_setImage(with: url) { (image, error, cache, url) in
                self.image = image
            }
        }
    }
}
