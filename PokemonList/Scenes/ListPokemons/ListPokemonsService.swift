import Foundation

protocol ListPokemonsServicing {
    func getPokedex(success: @escaping(PokedexObject) -> Void)
}

final class ListPokemonsService {
    private static let configuration: URLSessionConfiguration = {
        let config =  URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    
    private let session = URLSession(configuration: configuration)
}

// MARK: - ListPokemonsServicing
extension ListPokemonsService: ListPokemonsServicing {
    func getPokedex(success: @escaping(PokedexObject) -> Void) {
        guard let url = URL(string: "https://private-a14951-pokedex3.apiary-mock.com/pokedex") else { return }
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, erro: Error?) in
            if erro == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let products = try JSONDecoder().decode(PokedexObject.self, from: data)
                        success(products)

                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("Algum status invalido")
                }
            } else {
                print(erro!)
            }
        }
        dataTask.resume()
    }
}
