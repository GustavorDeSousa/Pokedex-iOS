import UIKit

struct ColorUI {
    static var empty = "none"
    
    static func color(_ color: String) -> UIColor {
        switch color {
        case "Grass":
            return #colorLiteral(red: 0.2745098039, green: 0.5882352941, blue: 0.4823529412, alpha: 1)
        case "Poison":
            return #colorLiteral(red: 0.5349693298, green: 0.1285475492, blue: 0.6013351679, alpha: 1)
        case "Fire":
            return #colorLiteral(red: 1, green: 0.3776848912, blue: 0.3415145874, alpha: 1)
        case "Flying":
            return #colorLiteral(red: 0.5536555648, green: 0.7367753386, blue: 0.742988646, alpha: 1)
        case "Water":
            return #colorLiteral(red: 0.2714582086, green: 0.5406671166, blue: 1, alpha: 1)
        case "Bug":
            return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        default:
            return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }        
    }
}
