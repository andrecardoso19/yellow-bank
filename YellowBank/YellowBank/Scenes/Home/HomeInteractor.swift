//
//  HomeInteractor.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

protocol HomeInteracting: AnyObject {
    func loadData()
    func loadSpecificData(jsonType: JSONType)
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
    func loadSpecificData(jsonType: JSONType) {
        service.getSpecificData(jsonType: jsonType) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let homeResponse):
                handleSuccess(homeResponse: homeResponse)
            case .failure(let error):
                handleError(error: error)
            }
        }
    }
    
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
        if let header = homeResponse.header, !header.title.text.isEmpty {
            presenter.presentHeader(header: homeResponse.header?.title ?? .init())
        } else {
            presenter.removeHeader()
        }
        presenter.presentHome(homeResponse: homeResponse)
        presenter.stopLoading()
    }
    
    func handleError(error: HomeApiError) {
        presenter.displayError(error: error)
        presenter.stopLoading()
    }
}
