import Foundation
import XCTest
@testable import PokemonList

private
final class ListPokemonsViewControllerSpy: UIViewController, ListPokemonsDisplaying {
    private(set) var updateListCallCount = 0

    func updateListPokedex(_ pokemon: PokedexObject) {
        updateListCallCount += 1
    }
}


final class ListPokemonsPresenterTests: XCTestCase {
    private let coordinator = ListPokemonsCoordinator()
    private let viewControllerSpy = ListPokemonsViewControllerSpy()
    private var sut: ListPokemonsPresenter?
    
    override func setUp() {
//        sut = ListPokemonsPresenter(coordinator: coordinator)
//        sut?.viewController = viewControllerSpy
    }

    override func tearDown() {
        sut = nil
    }
    
    func teste() {
//        getMockPokedex()
    }

}
