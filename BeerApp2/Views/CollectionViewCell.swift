//
//  CollectionViewCell.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 23/09/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let tituloLabel: UILabel = .textBoldLabel(text: "Hello My Name Is Mette-Mari", fontSize: 18, numberOfLines: 3, textAlignment: .center)
    let abvLabel: UILabel = .textLabel(text: "55.0", fontSize: 15, textAlignment: .center)
    let imageView: UIImageView = .smallBeer(named: "beer2.png")
    let squareView: UIView = {
        let view = UIView(frame: .init(x: 10, y: 10, width: 50, height: 50))
        view.layer.cornerRadius = view.bounds.width / 2
        view.backgroundColor = .breja
        return view
    }()
    let backView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
            
        let boxView = UIView()
        boxView.clipsToBounds = true
        backView.backgroundColor = .breja
        backView.layer.cornerRadius = 16
        
        let stack = UIStackView(arrangedSubviews: [abvLabel])
        squareView.addSubview(stack)
        stack.preencherSuperview()
        
        
        
        boxView.addSubview(backView)
        boxView.addSubview(imageView)
        boxView.addSubview(squareView)
        backView.preencherSuperview(padding: .init(top: 100, left: 0, bottom: 0, right: 0))
        
        
        imageView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor).isActive = true
        imageView.size(size: .init(width: 30, height: 190))
        
        let stackViewTextos = UIStackView(arrangedSubviews: [tituloLabel])
        stackViewTextos.axis = .vertical
        stackViewTextos.spacing = 1
        
        let stackView = UIStackView(arrangedSubviews: [boxView, stackViewTextos])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.preencherSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
