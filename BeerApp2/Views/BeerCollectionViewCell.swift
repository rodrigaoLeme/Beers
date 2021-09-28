//
//  BeerCollectionViewCell.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 26/09/21.
//

import UIKit

class BeerCollectionViewCell: UICollectionViewCell {
    let abvTituloLabel: UILabel = .textBoldLabel(text: "ABV Score", fontSize: 18, textColor: .white)
    let abvLabel: UILabel = .textBoldLabel(text: "55.0", fontSize: 40, textAlignment: .left)
    
    let ibuTituloLabel: UILabel = .textBoldLabel(text: "IBU Score", fontSize: 18, textColor: .white)
    let ibuLabel: UILabel = .textBoldLabel(text: "40.0", fontSize: 40, textAlignment: .left)
    
    let imageView: UIImageView = .smallBeer(named: "beer2.png")
    let backView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .red
        //alpha = 0
        
        clipsToBounds = true
            
        let boxView = UIView()
        boxView.clipsToBounds = true
        backView.backgroundColor = .breja
        backView.layer.cornerRadius = 0
        
        let stackAbv = UIStackView(arrangedSubviews: [abvTituloLabel, abvLabel])
        //squareView.addSubview(stack)
        stackAbv.axis = .vertical
        stackAbv.spacing = 0
        
        let stackIbu = UIStackView(arrangedSubviews: [ibuTituloLabel, ibuLabel])
        stackIbu.axis = .vertical
        stackIbu.spacing = 0
        
        let stackScores = UIStackView(arrangedSubviews: [stackAbv, stackIbu])
        stackScores.axis = .vertical
        stackScores.spacing = 30
        
        
        boxView.addSubview(backView)
        boxView.addSubview(imageView)
        boxView.addSubview(stackScores)
        //boxView.addSubview(squareView)
        backView.preencherSuperview()
        stackScores.preencher(top: backView.topAnchor, leading: backView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 100, left: 20, bottom: 0, right: 0))
        
        
        imageView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor).isActive = true
        imageView.size(size: .init(width: 80, height: 290))
        
        let stackViewTextos = UIStackView()
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
