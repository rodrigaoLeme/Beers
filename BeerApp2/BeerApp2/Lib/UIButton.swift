//
//  UIButton.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 23/09/21.
//

import UIKit

extension UIButton {
    static func closeButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "fechar"), for: .normal)
        button.layer.zPosition = 2
        return button
    }
}
