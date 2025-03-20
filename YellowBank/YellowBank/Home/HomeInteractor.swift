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
                handleSuccess(homeResponse: homeResponse)
            case .failure(let error):
                handleError(error: error)
            }
        }
    }
}

private extension HomeInteractor {
    func handleSuccess(homeResponse: HomeResponse) {
        if homeResponse.items.isEmpty {
            handleError(error: .emptyData)
            return
        }
        if homeResponse.header.title.text.isEmpty {
            presenter.removeHeader()
        } else {
            presenter.presentHeader(header: homeResponse.header.title)
        }
        presenter.presentHome(homeResponse: homeResponse)
    }
    
    func handleError(error: HomeApiError) {
        presenter.displayError(error: error)
    }
}
