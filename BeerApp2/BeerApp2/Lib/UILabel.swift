//
//  UILabel.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 23/09/21.
//

import UIKit

extension UILabel {
    static func textLabel (text: String, fontSize: CGFloat, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left, textColor: UIColor = .black) -> UILabel {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        label.text = text
        label.textAlignment = textAlignment
        label.textColor = textColor
        
        return label
    }
}

extension UILabel {
    static func textBoldLabel (text: String, fontSize: CGFloat, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left, textColor: UIColor = .black) -> UILabel {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLines
        label.text = text
        label.textAlignment = textAlignment
        label.textColor = textColor
        
        return label
    }
}
