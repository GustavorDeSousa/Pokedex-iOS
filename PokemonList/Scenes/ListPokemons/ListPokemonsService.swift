import Foundation

protocol ListPokemonsServicing {
    func getPokedex(completion: @escaping(Result<PokedexObject, Error>) -> Void)
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
    func getPokedex(completion: @escaping(Result<PokedexObject, Error>) -> Void) {
        guard let url = URL(string: "https://private-a14951-pokedex3.apiary-mock.com/pokedex") else {
            completion(.failure(API_ERROR.invaliURL))
            return
        }
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, erro: Error?) in
            if erro == nil {
                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(API_ERROR.invaliURL))
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let pokedex = try JSONDecoder().decode(PokedexObject.self, from: data)
                        completion(.success(pokedex))
                    } catch {
                        completion(.failure(API_ERROR.invaliData))
                    }
                } else {
                    completion(.failure(API_ERROR.invaliData))
                }
            } else {
                completion(.failure(API_ERROR.invaliData))
            }
        }
        dataTask.resume()
    }
}

enum API_ERROR: Error {
    case invaliData
    case invaliURL
    case invaliHTTP
}
