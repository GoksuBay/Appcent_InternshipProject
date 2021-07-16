//
//  UIImageView+Extension.swift
//  Appcent_InternshipProject
//
//  Created by Yusuf Ali Cezik on 16.07.2021.
//

import UIKit

/* USAGE
 let urlString = "https://imageurl.com"
 imageView.getImage(with: urlString)
*/

let imageCache = NSCache<NSString, NSData>()

extension UIImageView {
    func getImage(with urlString: String) -> Void {
        guard let url = URL(string: urlString) else{
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)){
            DispatchQueue.main.async {
                self.setImage(data: cachedImage as Data, urlString: urlString)
            }
        } else{
            URLSession.shared.dataTask(with: url) { [weak self] (data,response,error) in
                guard error == nil, let data = data else {
                    return
                }
                self?.setImage(data: data, urlString: url.absoluteString)
            }.resume()
        }
    }
    
    private func setImage(data: Data?, urlString: String) {
        DispatchQueue.main.async {
            if let data = data, let downloadedImage = UIImage(data: data) {
                self.image = downloadedImage
                imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
            }
        }
    }
}
