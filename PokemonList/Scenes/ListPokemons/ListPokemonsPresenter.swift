import Foundation

protocol ListPokemonsPresenting: AnyObject {
    var viewController: ListPokemonsDisplaying? { get set }
    func updateListPokedex(_ pokemon: PokedexObject)
}

final class ListPokemonsPresenter {
    private let coordinator: ListPokemonsCoordinating
    weak var viewController: ListPokemonsDisplaying?

    init(coordinator: ListPokemonsCoordinating) {
        self.coordinator = coordinator
    }
}

// MARK: - ListPokemonsPresenting
extension ListPokemonsPresenter: ListPokemonsPresenting {
    func updateListPokedex(_ pokemon: PokedexObject) {
        viewController?.updateListPokedex(pokemon)
    }
}
