//
//  CustomImageView.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/29/19.
//


import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func downloadImeg (from url: String?) {
        imageUrlString = url
        self.image = nil
        
        if let cachedImeg = imageCache.object(forKey: url as AnyObject) as? UIImage {
            DispatchQueue.main.async {
                self.image = cachedImeg
            }
            return
        }
        if let urlS = URL(string: url ?? "") {
            let urlRequest = URLRequest (url: urlS)
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if error != nil {
                    return
                }
                if let data = data, let downloadedImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        if self.imageUrlString == url {
                            self.image = downloadedImage
                        }
                        imageCache.setObject(downloadedImage, forKey: url as AnyObject)
                    }
                }
            }
            task.resume()
        }
        
    }
}

