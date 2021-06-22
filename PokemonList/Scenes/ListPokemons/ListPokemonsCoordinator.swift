import UIKit

enum ListPokemonsAction {
}

protocol ListPokemonsCoordinating: AnyObject {
    var viewController: UIViewController? { get set }
    func perform(action: ListPokemonsAction)
}

final class ListPokemonsCoordinator {
    weak var viewController: UIViewController?
}

// MARK: - ListPokemonsCoordinating
extension ListPokemonsCoordinator: ListPokemonsCoordinating {
    func perform(action: ListPokemonsAction) {
    }
}
