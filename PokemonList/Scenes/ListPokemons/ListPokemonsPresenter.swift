import Foundation

protocol ListPokemonsPresenting: AnyObject {
    var viewController: ListPokemonsDisplaying? { get set }
    func displaySomething()
    func didNextStep(action: ListPokemonsAction)
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
    func displaySomething() {
        viewController?.displaySomething()
    }
    
    func didNextStep(action: ListPokemonsAction) {
        coordinator.perform(action: action)
    }
}
