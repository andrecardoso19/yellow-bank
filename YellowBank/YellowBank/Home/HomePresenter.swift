//
//  HomePresenter.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

protocol HomePresenting: AnyObject {
    func displaySomething()
    func didNextStep()
    func displayError()
}

final class HomePresenter {
    weak var viewController: HomeDisplaying?
}

// MARK: - HomePresenting
extension HomePresenter: HomePresenting {
    func displaySomething() {
        viewController?.displaySomething()
    }
    
    func didNextStep() {
        viewController?.displaySomething()
    }
    
    func displayError() {
        viewController?.displayError()
    }
}
