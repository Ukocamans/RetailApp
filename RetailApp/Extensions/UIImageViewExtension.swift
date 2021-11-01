//
//  UIImageViewExtension.swift
//  RetailApp
//
//  Created by Umurcan Kocaman [Bireysel Mobil Bankacilik Squad 2] on 1.11.2021.
//

import Foundation
import UIKit

extension UIImageView: URLSessionDelegate {
    
    func imageFromServerURL(urlString: String, placeHolderImage:UIImage? = UIImage(named: "")) -> URLSessionDataTask? {
        
        if self.image == nil{
            self.image = placeHolderImage
        }
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: .main)

        return session.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
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
    
    func loadImage(url: String?) -> URLSessionDataTask?  {
        guard let url = url else {
            return nil
        }
        return imageFromServerURL(urlString: url)
    }
    
    //Need for self signed certificate
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}
