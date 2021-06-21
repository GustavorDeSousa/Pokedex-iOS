import UIKit

enum ListPokemonsFactory {
    static func make() -> ListPokemonsViewController {
        let service: ListPokemonsServicing = ListPokemonsService()
        let coordinator: ListPokemonsCoordinating = ListPokemonsCoordinator()
        let presenter: ListPokemonsPresenting = ListPokemonsPresenter(coordinator: coordinator)
        let interactor = ListPokemonsInteractor(service: service, presenter: presenter)
        let viewController = ListPokemonsViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
