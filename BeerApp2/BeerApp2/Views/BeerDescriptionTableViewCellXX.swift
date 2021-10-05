//
//  BeerDescriptionCollectionViewCell.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 27/09/21.
//

import UIKit

class BeerDescriptionTableViewCellXX: UITableViewCell {
    
    let tituloLabel: UILabel = .textBoldLabel(text: "Hello My Name Is Mette-Mari", fontSize: 25, numberOfLines: 3, textAlignment: .center)
    
    let descricaoLabel: UILabel = .textLabel(text: "Bohemian Pilsner", fontSize: 15, numberOfLines: 2, textAlignment: .center)
    
    let fullText: UILabel = .textLabel(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam at fermentum metus, at egestas nisl. Mauris ultrices dictum est, quis maximus ante consectetur ac. Pellentesque tempor urna condimentum diam cursus, dignissim maximus urna vestibulum. Cras vitae diam fringilla, rutrum justo non, interdum nibh. In ipsum nibh, faucibus sit amet elit eu, vulputate viverra metus. Proin sed sem malesuada tortor vestibulum semper non tincidunt risus. Nunc non justo vel dolor accumsan accumsan. ", fontSize: 18, numberOfLines: 3, textAlignment: .justified, textColor: .black)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       
        //let stackView = UIStackView(arrangedSubviews: [tituloLabel, descricaoLabel, fullText])
        backgroundColor = .blue
        addSubview(tituloLabel)
        tituloLabel.preencherSuperview()
        
        //size(size: .init(width: 320, height: 300))
        
        print(self.bounds)
    }

        
        
        
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
