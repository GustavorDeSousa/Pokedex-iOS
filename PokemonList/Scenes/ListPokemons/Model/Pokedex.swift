import Foundation

struct Pokedex: Decodable, Equatable {
    let name: String
    let number: String
    let image: String
    let firstType: String
    let secondType: String?
    
    private enum CodingKeys: String, CodingKey {
        case name, number, image
        case firstType = "first_type"
        case secondType = "second_type"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        number = try container.decode(String.self, forKey: .number)
        image = try container.decode(String.self, forKey: .image)
        firstType = try container.decode(String.self, forKey: .firstType)
        secondType = try container.decodeIfPresent(String.self, forKey: .secondType)
    }
}
