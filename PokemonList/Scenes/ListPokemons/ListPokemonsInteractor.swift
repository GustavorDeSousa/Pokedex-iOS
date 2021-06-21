import Foundation

protocol ListPokemonsInteracting: AnyObject {
    func doSomething()
}

final class ListPokemonsInteractor {
    private let service: ListPokemonsServicing
    private let presenter: ListPokemonsPresenting

    init(service: ListPokemonsServicing, presenter: ListPokemonsPresenting) {
        self.service = service
        self.presenter = presenter
    }
}

// MARK: - ListPokemonsInteracting
extension ListPokemonsInteractor: ListPokemonsInteracting {
    func doSomething() {
        presenter.displaySomething()
    }
}
