import Foundation

protocol ListPokemonsInteracting: AnyObject {
    func getServicePokedex()
    func getPokedex() -> PokedexObject
}

final class ListPokemonsInteractor {
    private let service: ListPokemonsServicing
    private let presenter: ListPokemonsPresenting
    
    var pokedexList: PokedexObject?
    
    init(service: ListPokemonsServicing, presenter: ListPokemonsPresenting) {
        self.service = service
        self.presenter = presenter
    }
}

// MARK: - ListPokemonsInteracting
extension ListPokemonsInteractor: ListPokemonsInteracting {
    func getPokedex() -> PokedexObject {
        return pokedexList ?? PokedexObject(pokemons: [])
    }
    
    func getServicePokedex() {
        service.getPokedex { result in
            self.pokedexList = result
            self.presenter.updateListPokedex()
        }
    }
}
