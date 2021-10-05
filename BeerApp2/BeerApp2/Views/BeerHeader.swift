//
//  BeerHeader.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 28/09/21.
//

import UIKit

class BeerHeader: UICollectionReusableView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Beer App"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 34)
        label.textAlignment = .center
        return label
    }()
    
    let perfilImageView: UIImageView = {
        let imagem = UIImageView()
        imagem.size(size: .init(width: 60, height: 60))
        imagem.layer.cornerRadius = 30
        imagem.clipsToBounds = true
        imagem.image = UIImage(named: "perfil")
        imagem.contentMode = .scaleAspectFill
        return imagem
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, perfilImageView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        
        addSubview(stackView)
        stackView.preencher(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 84, bottom: 0, right: 24))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
