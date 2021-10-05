//
//  Beer.swift
//  BeerApp2
//
//  Created by Rodrigo Leme on 28/09/21.
//

import Foundation

class Beer: Decodable {
        var id: Int
        var name: String
        var tagline: String
        var description: String
        var image_url: String
        var abv: Double
        var ibu: Double?
        
}
