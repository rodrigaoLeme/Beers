//
//  BeerService.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 28/09/21.
//

import Foundation

class BeerService {
    static let shared = BeerService()
    
    let API = "https://api.punkapi.com/v2/beers"
    
    func buscaBeer (completion: @escaping ([Beer]?, Error?) ->()) {
        guard let url = URL(string: API) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                completion(nil,err)
                return
            }
            
            do {
                guard let data = data else {return}
                let beers = try JSONDecoder().decode([Beer].self, from: data)
                completion(beers, nil)
            } catch let err {
                completion(nil,err)
                return
            }
        }.resume()
    }
}
