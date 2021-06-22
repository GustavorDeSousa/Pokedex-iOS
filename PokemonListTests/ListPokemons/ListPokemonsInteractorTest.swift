import XCTest
@testable import PokemonList

class ListPokemonsInteractorTest: XCTestCase {
    private let service = ListPokemonsServiceStub()
    private let presenter = ListPokemonsPresenterSpy()
    
    private lazy var sut: ListPokemonsInteractor = ListPokemonsInteractor(service: service, presenter: presenter)

    func testPresentUpdateListPokedex_WhenListPokemonsSuccess_ShouldDisplayListPokemons() {
        // given
        let dummy = ListPokemonsDummy()
        let response = dummy.getPokedex()
        //when
        sut.getServicePokedex()
        service.completeSuccessfully(with: response)
        //then
        XCTAssertEqual(presenter.pokedexObjects, [response])
    }
}
