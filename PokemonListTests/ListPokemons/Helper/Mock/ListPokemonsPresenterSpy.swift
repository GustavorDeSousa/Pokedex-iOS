import Foundation
@testable import PokemonList

final class ListPokemonsPresenterSpy: ListPokemonsPresenting {
    var viewController: ListPokemonsDisplaying?
    var currentAction: ListPokemonsAction?
    
    private(set) var pokedexObjects: [PokedexObject] = []

    func updateListPokedex(_ pokemon: PokedexObject) {
        pokedexObjects.append(pokemon)
    }
}
