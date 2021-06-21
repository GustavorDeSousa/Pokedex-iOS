import UIKit

protocol ListPokemonsDisplaying: AnyObject {
    func displaySomething()
}

private extension ListPokemonsViewController.Layout {
    //example
    enum Size {
        static let imageHeight: CGFloat = 90.0
    }
}

final class ListPokemonsViewController: UIViewController {
    fileprivate enum Layout { }

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
        let otherView = UIView()
        otherView.backgroundColor = .red
        view = otherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor.doSomething()
    }
}

// MARK: - ListPokemonsDisplaying
extension ListPokemonsViewController: ListPokemonsDisplaying {
    func displaySomething() { }
}
