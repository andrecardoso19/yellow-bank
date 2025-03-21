//
//  HomeFactory.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

import UIKit

enum HomeFactory {
    static func make(mockType: JSONType = .defaultMock, mockString: String? = nil) -> UIViewController {
        let service = HomeService(mockType: mockType, mockString: mockString)
        let presenter = HomePresenter()
        let interactor = HomeInteractor(service: service, presenter: presenter)
        let viewController = HomeViewController(interactor: interactor)

        presenter.viewController = viewController

        return viewController
    }
}
