import Foundation
@testable import PokemonList

final class ListPokemonsServiceStub: ListPokemonsServicing {
    private(set) var completions = [(Result<PokedexObject, Error>) -> Void]()
    
    func getPokedex(completion: @escaping (Result<PokedexObject, Error>) -> Void) {
        completions.append(completion)
    }
    
    func completeSuccessfully(with model: PokedexObject, index: Int = 0) {
        completions[index](.success(model))
    }
    
    func completeError(with error: Error = API_ERROR.invaliData , index: Int = 0) {
        completions[index](.failure(error))
    }
}
