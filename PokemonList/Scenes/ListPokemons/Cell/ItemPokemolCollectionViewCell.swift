import SnapKit
import UIKit

private extension ItemPokemolCollectionViewCell.Layout {
    enum Margin {
        static let small: CGFloat = 6.0
        static let medium: CGFloat = 12.0
        static let big: CGFloat = 18.0
        static let bigx: CGFloat = 24.0
    }
    
    enum Height {
        static let label: CGFloat = 40.0
    }
}

class ItemPokemolCollectionViewCell: UICollectionViewCell {
    fileprivate enum Layout { }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var namePokemon: UILabel = {
        let label = UILabel()
        label.text = "Desconhecido"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var codePokemon: UILabel = {
        let label = UILabel()
        label.text = "#000"
        label.textColor = #colorLiteral(red: 0.4355472922, green: 0.4324404597, blue: 0.4379293621, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var typePokemonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var firstTypePokemonView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var secondTypePokemonView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var firstPokemonLabel: UILabel = {
        let label = UILabel()
        label.text = "???"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 10.0)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var secondPokemonLabel: UILabel = {
        let label = UILabel()
        label.text = "???"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 10.0)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var imagePokemon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "random")
        return imageView
    }()
    
    private lazy var pokeballBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pokeball_background")
        imageView.alpha = 0.2
        return imageView
    }()
    
    private var spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    private var dataTask: URLSessionTask?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(pokemon: Pokedex) {
        addViews()
        addConstraints()
        setupsInfos(pokemon)
    }
}

private
extension ItemPokemolCollectionViewCell {
    func setupsInfos(_ pokemon: Pokedex) {
        spinner.startAnimating()
        
        namePokemon.text = pokemon.name
        codePokemon.text = pokemon.number
        firstPokemonLabel.text = pokemon.firstType
        
        if let secondType = pokemon.secondType {
            secondTypePokemonView.isHidden = false
            secondPokemonLabel.text = secondType
        } else {
            secondTypePokemonView.isHidden = true
        }
        
        uploadImage(url: pokemon.image)
        setupColor(pokemon)
    }
    
    func setupColor(_ pokemon: Pokedex) {
        let background = ColorUI.color(pokemon.firstType).withAlphaComponent(0.6)
        containerView.backgroundColor = background
        firstTypePokemonView.backgroundColor = ColorUI.color(pokemon.firstType)
        secondTypePokemonView.backgroundColor = ColorUI.color(pokemon.secondType ?? ColorUI.empty)
    }
    
    func uploadImage(url: String) {
        guard let url = URL(string: url) else { return }
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.imagePokemon.image = image
            }
        }
        dataTask?.resume()
    }
    
    func addViews() {
        addSubview(containerView)
        
        [namePokemon, codePokemon].forEach { component in
            headerStackView.addArrangedSubview(component)
        }
        
        containerView.addSubview(headerStackView)
        containerView.addSubview(typePokemonStackView)
        containerView.addSubview(pokeballBackground)
        containerView.addSubview(imagePokemon)
        
        firstTypePokemonView.addSubview(firstPokemonLabel)
        secondTypePokemonView.addSubview(secondPokemonLabel)
        
        [firstTypePokemonView, secondTypePokemonView].forEach { component in
            typePokemonStackView.addArrangedSubview(component)
        }
        
        containerView.addSubview(spinner)
    }
    
    func addConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Layout.Margin.small)
        }
        
        headerStackView.snp.makeConstraints { make in
            make.top.equalTo(containerView).offset(Layout.Margin.big)
            make.leading.trailing.equalTo(containerView).inset(Layout.Margin.medium)
            make.height.equalTo(30)
        }
        
        typePokemonStackView.snp.makeConstraints { make in
            make.top.equalTo(headerStackView.snp.bottom).offset(Layout.Margin.bigx)
            make.bottom.lessThanOrEqualTo(containerView.snp.bottom).inset(Layout.Margin.medium)
            make.leading.equalTo(containerView).inset(Layout.Margin.medium)
        }
        
        pokeballBackground.snp.makeConstraints { make in
            make.top.equalTo(headerStackView.snp.bottom).offset(Layout.Margin.medium)
            make.bottom.equalTo(containerView.snp.bottom).inset(Layout.Margin.small)
            make.leading.equalTo(typePokemonStackView.snp.trailing).offset(Layout.Margin.small)
            make.trailing.equalTo(containerView).inset(Layout.Margin.small)
            make.width.equalTo(80)
        }
        
        imagePokemon.snp.makeConstraints { make in
            make.top.equalTo(headerStackView.snp.bottom).offset(Layout.Margin.medium)
            make.bottom.equalTo(containerView.snp.bottom).inset(Layout.Margin.small)
            make.leading.equalTo(typePokemonStackView.snp.trailing).offset(Layout.Margin.small)
            make.trailing.equalTo(containerView).inset(Layout.Margin.small)
            make.width.equalTo(80)
        }
        
        firstPokemonLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Layout.Margin.small)
        }
        
        secondPokemonLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Layout.Margin.small)
        }
        
        firstTypePokemonView.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        secondTypePokemonView.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        spinner.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
