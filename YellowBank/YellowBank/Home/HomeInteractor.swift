//
//  HomeInteractor.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

protocol HomeInteracting: AnyObject {
    func loadSomething()
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
    func loadSomething() {
        presenter.displaySomething()
    }
}

private extension HomeInteractor {

}
