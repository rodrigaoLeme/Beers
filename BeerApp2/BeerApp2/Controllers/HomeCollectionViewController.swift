//
//  HomeCollectionViewController.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 23/09/21.
//

import UIKit

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var beers: [Beer] = []
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    let cellId = "cellId"
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(BeerHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        self.buscaBeer()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension HomeCollectionViewController {
    
    func buscaBeer() {
        BeerService.shared.buscaBeer { (beers, err) in
            if let beers = beers {
                DispatchQueue.main.async {
                    self.beers = beers
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! BeerHeader
        
        return header
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.beers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        cell.beer = beers[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width / 2 - 35, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            if let frame = cell.superview?.convert(cell.frame, to: nil) {
                
                let modalView = BeerDetalheViewController()
                modalView.modalPresentationStyle = .overCurrentContext
                
//                let modalNav = UINavigationController(rootViewController: modalView)
//                modalNav.modalPresentationStyle = .overCurrentContext
//                modalNav.view.backgroundColor = .clear
                
//                self.present(modalNav, animated: false) {
//                    modalView.frame = frame
//                    modalView.addView()
//                }
                
                self.present(modalView, animated: false) {
                    modalView.frame = frame
                    modalView.beer = self.beers[indexPath.item]
                    modalView.addView()
                }
                
            }
            
        }
    }
    
}
