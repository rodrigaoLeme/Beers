//
//  UIImageView.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 23/09/21.
//

import UIKit

extension UIImageView {
    static func smallBeer (named: String? = nil) -> UIImageView {
        let imagem = UIImageView()
        imagem.translatesAutoresizingMaskIntoConstraints = false
        if let named = named {
            imagem.image = UIImage(named: named)
        }
        imagem.contentMode = .scaleAspectFill
        return imagem
    }
    

    func loadImageWithUrl(_ url: URL) {
        
        let imageCache = NSCache<AnyObject, AnyObject>()
        var imageURL: URL?
        let activityIndicator = UIActivityIndicatorView()

        // setup activityIndicator
        activityIndicator.color = .darkGray

        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        imageURL = url

        image = nil
        activityIndicator.startAnimating()

        // retorna a imagem caso esteja disponível no cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imageFromCache
            activityIndicator.stopAnimating()
            return
        }

        // Imagem não disponível no cache, então retorna da ULR
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                print(error as Any)
                DispatchQueue.main.async(execute: {
                    activityIndicator.stopAnimating()
                })
                return
            }
            DispatchQueue.main.async(execute: {
                if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {
                    if imageURL == url {
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
                activityIndicator.stopAnimating()
            })
        }).resume()
    }
}
