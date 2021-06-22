import Foundation

protocol ListPokemonsPresenting: AnyObject {
    var viewController: ListPokemonsDisplaying? { get set }
    func updateListPokedex()
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
    func updateListPokedex() {
        viewController?.updateListPokedex()
    }
}
