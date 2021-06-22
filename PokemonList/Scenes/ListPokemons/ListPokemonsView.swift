import UIKit
import SnapKit

public final
class ListPokemonsView: UIView {
    lazy var pokemonListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collection.register(
            ItemPokemolCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: ItemPokemolCollectionViewCell.self)
        )
        
        collection.backgroundColor = .white
        return collection
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private
extension ListPokemonsView {
    func addViews() {
        addSubview(pokemonListCollectionView)
    }
    
    func addConstraints() {
        pokemonListCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
