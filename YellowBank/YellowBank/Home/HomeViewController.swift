//
//  ViewController.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

import UIKit

protocol HomeDisplaying: AnyObject {
    func displayHome(cells: [UITableViewCell])
    func displayError()
}

final class HomeViewController: UIViewController {
    private let interactor: HomeInteracting
    private var cells: [UITableViewCell] = []
    
    private lazy var backgroundLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        layer.colors = [UIColor.orange.cgColor, UIColor.white.cgColor]
        return layer
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.bounces = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(GenericSectionCell.self, forCellReuseIdentifier: GenericSectionCell.reuseId)
        
        return tableView
    }()
    
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
        buildLayout()
        tableView.reloadData()
        interactor.loadData()
    }
    
    private func buildLayout() {
        setupViews()
        setupLayoutConstraints()
    }
    
    private func setupViews() {
        view.layer.addSublayer(backgroundLayer)
        view.addSubview(tableView)
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cells[indexPath.row]
    }
}

// MARK: - HomeDisplaying
extension HomeViewController: HomeDisplaying {
    func displayHome(cells: [UITableViewCell]) {
        self.cells = cells
        tableView.reloadData()
    }
    
    func displayError() {
        // a fazer
    }
}
