import Foundation
import XCTest
@testable import PokemonList

final class ListPokemonsDummy {
    let jsonData = """
    {
            "pokemons": [
                {
                    "name": "Bulbasaur",
                    "number": "#001",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
                    "first_type": "Grass",
                    "second_type": "Poison",
                    "first_color": "green",
                    "second_color": "dark_green"
                },
                {
                    "name": "Ivysaur",
                    "number": "#002",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png",
                    "first_type": "Grass",
                    "second_type": "Poison",
                    "first_color": "green",
                    "second_color": "dark_green"
                },
                {
                    "name": "Venusaur ",
                    "number": "#003",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
                    "first_type": "Grass",
                    "second_type": "Poison",
                    "first_color": "green",
                    "second_color": "dark_green"
                },
                {
                    "name": "Charmander ",
                    "number": "#004",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
                    "first_type": "Fire",
                    "second_type": null,
                    "first_color": "red",
                    "second_color": "dark_red"
                },
                {
                    "name": "Charmeleon",
                    "number": "#005",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png",
                    "first_type": "Fire",
                    "second_type": null,
                    "first_color": "red",
                    "second_color": "dark_red"
                },
                {
                    "name": "Charmander",
                    "number": "#006",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png",
                    "first_type": "Fire",
                    "second_type": "Flying",
                    "first_color": "red",
                    "second_color": "dark_red"
                },
                {
                    "name": "Squirtle",
                    "number": "#007",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
                    "first_type": "Water",
                    "second_type": null,
                    "first_color": "blue",
                    "second_color": "dark_blue"
                }, {
                    "name": "Wartortle",
                    "number": "#008",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png",
                    "first_type": "Water",
                    "second_type": null,
                    "first_color": "blue",
                    "second_color": "dark_blue"
                }, {
                    "name": "Blastoise",
                    "number": "#009",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png",
                    "first_type": "Water",
                    "second_type": null,
                    "first_color": "blue",
                    "second_color": "dark_blue"
                }, {
                    "name": "Caterpie",
                    "number": "#010",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png",
                    "first_type": "Bug",
                    "second_type": null,
                    "first_color": "green",
                    "second_color": "dark_green"
                }, {
                    "name": "Metapod",
                    "number": "#011",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png",
                    "first_type": "Bug",
                    "second_type": null,
                    "first_color": "green",
                    "second_color": "dark_green"
                }, {
                    "name": "Butterfree",
                    "number": "#012",
                    "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png",
                    "first_type": "Bug",
                    "second_type": null,
                    "first_color": "green",
                    "second_color": "dark_green"
                }
            ]
        }
    """.data(using: .utf8)!
    
    func getPokedex() -> PokedexObject {
        do {
            let decoder = JSONDecoder()
            let pokedex = try decoder.decode(PokedexObject.self, from: jsonData)
            return pokedex
        } catch {
            print(error)
        }
        return PokedexObject(pokemons: [])
    }
}
