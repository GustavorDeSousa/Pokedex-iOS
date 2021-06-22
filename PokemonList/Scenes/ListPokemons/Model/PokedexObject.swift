import Foundation

struct PokedexObject: Decodable, Equatable {
    let pokemons: [Pokedex]
    
    private enum CodingKeys: String, CodingKey {
        case pokemons
    }
}
