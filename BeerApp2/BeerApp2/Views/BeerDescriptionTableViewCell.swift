//
//  BeerDescriptionTableViewCell.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 27/09/21.
//

import UIKit

class BeerDescriptionTableViewCell: UITableViewCell {
    
    var beer: Beer? {
        didSet {
            if let beer = beer {
                self.tituloLabel.text = beer.name
                self.descricaoLabel.text = beer.tagline
                self.fullText.text = beer.description
            }
        }
    }
    
    let tituloLabel: UILabel = .textBoldLabel(text: "Hello My Name Is Mette-Mari", fontSize: 25, numberOfLines: 3, textAlignment: .center)
    
    let descricaoLabel: UILabel = .textLabel(text: "Bohemian Pilsner", fontSize: 20, numberOfLines: 2, textAlignment: .center)
    
    let fullText: UILabel = .textLabel(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam at fermentum metus, at egestas nisl. Mauris ultrices dictum est, quis maximus ante consectetur ac. Pellentesque tempor urna condimentum diam cursus, dignissim maximus urna vestibulum. Cras vitae diam fringilla, rutrum justo non, interdum nibh. In ipsum nibh, faucibus sit amet elit eu, vulputate viverra metus. Proin sed sem malesuada tortor vestibulum semper non tincidunt risus. Nunc non justo vel dolor accumsan accumsan. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam at fermentum metus, at egestas nisl. Mauris ultrices dictum est, quis maximus ante consectetur ac. Pellentesque tempor urna condimentum diam cursus, dignissim maximus urna vestibulum. Cras vitae diam fringilla, rutrum justo non, interdum nibh. In ipsum nibh, faucibus sit amet elit eu, vulputate viverra metus. Proin sed sem malesuada tortor vestibulum semper non tincidunt risus. Nunc non justo vel dolor accumsan accumsan. ", fontSize: 18, numberOfLines: 0, textAlignment: .justified, textColor: .black)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackViewTitles = UIStackView(arrangedSubviews: [tituloLabel, descricaoLabel])
        stackViewTitles.axis = .vertical
        stackViewTitles.spacing = 2
        
        let stackView = UIStackView(arrangedSubviews: [stackViewTitles, fullText])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        addSubview(stackView)
        stackView.preencherSuperview(padding: .init(top: 20, left: 24, bottom: 0, right: 24))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
