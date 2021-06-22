import UIKit

protocol ListPokemonsDisplaying: AnyObject {
    func updateListPokedex()
}

private extension ListPokemonsViewController.Layout {
    enum Size {
        static let cellHeight: CGFloat = 150.0
    }
}

final class ListPokemonsViewController: UIViewController {
    fileprivate enum Layout { }

    private let screenView = ListPokemonsView()
    private let interactor: ListPokemonsInteracting

    public init(interactor: ListPokemonsInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        interactor.getServicePokedex()
    }
    
    private func setup() {
        setupCollection()
        setupNavigation()
    }
    
    private func setupNavigation() {
        title = "Pokédex"
    }
    
    private func setupCollection() {
        screenView.pokemonListCollectionView.delegate = self
        screenView.pokemonListCollectionView.dataSource = self
    }
}

// MARK: - ListPokemonsDisplaying
extension ListPokemonsViewController: ListPokemonsDisplaying {
    func updateListPokedex() {
        DispatchQueue.main.async {
            self.screenView.pokemonListCollectionView.reloadData()
        }
    }
}

extension ListPokemonsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        interactor.getPokedex().pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: ItemPokemolCollectionViewCell.self),
                for: indexPath
        ) as? ItemPokemolCollectionViewCell else { return UICollectionViewCell()}
        cell.setup(pokemon: interactor.getPokedex().pokemons[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension ListPokemonsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let size = (collectionView.bounds.width / 2)
        return CGSize(width: size, height: Layout.Size.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat
    { 0 }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    { 0 }
}
