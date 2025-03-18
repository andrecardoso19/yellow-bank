//
//  HomeInteractor.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

protocol HomeInteracting: AnyObject {
    func loadData()
}

final class HomeInteractor {

    private let service: HomeServicing
    private let presenter: HomePresenting

    init(service: HomeServicing, presenter: HomePresenting) {
        self.service = service
        self.presenter = presenter
    }
}

// MARK: - HomeInteracting
extension HomeInteractor: HomeInteracting {
    func loadData() {
        service.getData { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let homeResponse):
                presenter.displaySomething()
            case .failure(let error):
                switch error {
                case .decodeFail:
                    handleError(error: error)
                }
            }
        }
    }
}

private extension HomeInteractor {
    func handleError(error: HomeApiError) {
        switch error {
        case .decodeFail:
            presenter.displayError()
        }
    }
}
