//
//  CollectionViewCell.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 23/09/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var beer: Beer? {
        didSet {
            if let beer = beer {
                self.tituloLabel.text = beer.name
                self.abvLabel.text = String(beer.abv)
                
//                DispatchQueue.main.async {
//                    if let image_url = URL(string: self.beer!.image_url) {
//                        do {
//                            let data = try Data(contentsOf: image_url)
//                            self.imageView.image = UIImage(data: data)
//                            self.gradientView.isHidden = true
//                        } catch let err {
//                            print(err)
//                        }
//                    }
//                }
                if let img_url = URL(string: self.beer!.image_url) {
                    self.imageView.loadImageWithUrl(img_url)
                }
            }
        }
    }
    
    let tituloLabel: UILabel = .textBoldLabel(text: "Hello My Name Is Mette-Mari", fontSize: 18, numberOfLines: 3, textAlignment: .center)
    let abvLabel: UILabel = .textLabel(text: "55.0", fontSize: 15, textAlignment: .center)
    let imageView: UIImageView = .smallBeer(named: "beer2.png")
    let squareView: UIView = {
        let view = UIView(frame: .init(x: 10, y: 10, width: 50, height: 50))
        view.layer.cornerRadius = view.bounds.width / 2
        view.backgroundColor = .breja
        return view
    }()
    //let gradientView = UIView()
    let backView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        layer.cornerRadius = 16
        backgroundColor = .white
        
        squareView.backgroundColor = .yellowBeer
            
        let boxView = UIView()
        boxView.clipsToBounds = true
        backView.backgroundColor = .yellowBeer
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
        
//        gradientView.clipsToBounds = true
//        addSubview(gradientView)
//        gradientView.frame = .init(x: 0, y: 0, width: bounds.width, height: bounds.height)
//        gradientView.preencherSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 0))
//        self.gradientAnimation()
        
        
    }
    
//    func gradientAnimation () {
//        let gradient = CAGradientLayer(layer: self.gradientView.layer)
//        gradient.colors = [UIColor.lightGray.cgColor, UIColor.init(red: 195/255, green: 195/255, blue: 195/255, alpha: 1).cgColor]
//        gradient.locations = [0,1]
//        gradient.startPoint = CGPoint(x:-1, y: 0)
//        gradient.endPoint = CGPoint(x: 2, y: 0)
//        gradient.frame = self.gradientView.bounds
//        
//        self.gradientView.layer.insertSublayer(gradient, at: 0)
//        
//        let animation = CABasicAnimation(keyPath: "locations")
//        animation.fromValue = [0, 0.3]
//        animation.toValue = [0.1, 2]
//        animation.repeatCount = Float.infinity
//        animation.speed = 0.3
//        gradient.add(animation, forKey: nil)
//        
//    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
