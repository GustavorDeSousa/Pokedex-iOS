//
//  Pokedex.swift
//  PokemonList
//
//  Created by Gustavo Rocha on 21/06/21.
//

import Foundation

struct PokedexObject: Decodable {
    let pokemons: [Pokedex]
}

struct Pokedex: Decodable {
    let name: String
    let number: String
    let image: String
    let firstType: String
    let secondType: String?
    let firstColor: String
    let secondColor: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case number
        case image
        case firstType = "first_type"
        case secondType = "second_type"
        case firstColor = "first_color"
        case secondColor = "second_color"
    }
}
