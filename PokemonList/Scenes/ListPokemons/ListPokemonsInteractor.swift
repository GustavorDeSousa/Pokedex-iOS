import Foundation

protocol ListPokemonsInteracting: AnyObject {
    func getServicePokedex()
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
    func getServicePokedex() {
        service.getPokedex { result in
            switch result {
            case let .success(object):
                self.presenter.updateListPokedex(object)
            case .failure:
                break
            }
        }
    }
}
