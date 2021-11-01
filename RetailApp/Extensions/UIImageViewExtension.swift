//
//  UIImageViewExtension.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation
import UIKit

public extension UIImageView {
    
    func imageFromServerURL(urlString: String, placeHolderImage:UIImage? = UIImage(named: "")) -> URLSessionDataTask? {
        
        if self.image == nil{
            self.image = placeHolderImage
        }

        return URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        })
    }
    
    func loadMovieImage(url: String?) -> URLSessionDataTask?  {
        guard let url = url else {
            return nil
        }
        return imageFromServerURL(urlString: url)
    }
}
