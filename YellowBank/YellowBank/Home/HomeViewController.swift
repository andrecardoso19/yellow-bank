//
//  ViewController.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

import UIKit

protocol HomeDisplaying: AnyObject {
    func displaySomething()
}

final class HomeViewController: UIViewController {
    private var interactor: HomeInteracting
    
    init(interactor: HomeInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        interactor.loadSomething()
    }
}

// MARK: - HomeDisplaying
extension HomeViewController: HomeDisplaying {
    func displaySomething() {
        // a fazer
    }
}


