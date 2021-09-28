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
}
