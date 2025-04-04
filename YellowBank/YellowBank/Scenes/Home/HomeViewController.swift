//
//  ViewController.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

import UIKit

protocol HomeDisplaying: AnyObject {
    func displayHome(cells: [CellFactory])
    func displayError()
    func displayHeader(header: HomeTitle)
    func removeHeader()
    func stopLoading()
}

final class HomeViewController: UIViewController {
    private let interactor: HomeInteracting
    private let refreshControl = UIRefreshControl()
    private var cells: [UITableViewCell] = []
    
    private lazy var headerView = DesignSystem.Components.toHeaderItem()
    
    private lazy var backgroundLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        layer.colors = [CGColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1.0), UIColor.white.cgColor]
        return layer
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        
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
        interactor.loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func buildLayout() {
        setupViews()
        setupLayoutConstraints()
        tableView.reloadData()
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
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = cells[indexPath.row] as? BalanceCell {
            cell.delegate = self
        }
        return cells[indexPath.row]
    }
}

// MARK: - HomeDisplaying
extension HomeViewController: HomeDisplaying {
    func displayHome(cells: [CellFactory]) {
        self.cells = cells.map{ factory in
            factory.makeCell()
        }
        tableView.reloadData()
    }
    
    func displayError() {
        let errorView = DesignSystem.Components.toErrorView()
        errorView.delegate = self
        view.addSubview(errorView)
        
        NSLayoutConstraint.activate([
            errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorView.widthAnchor.constraint(equalToConstant: 320),
            errorView.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    func displayHeader(header: HomeTitle) {
        tableView.removeFromSuperview()
        view.addSubview(headerView)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 45),
            
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
        headerView.setDTO(dto: .init(title: .init(text: header.text, fontSize: header.fontSize, color: header.color)))
    }
    
    func removeHeader() {
        tableView.removeFromSuperview()
        headerView.removeFromSuperview()
        buildLayout()
    }
    
    func stopLoading() {
        refreshControl.endRefreshing()
    }
}

extension HomeViewController: ErrorViewDelegate {
    func onReturnButtonClick() {
        navigationController?.popViewController(animated: true)
    }
}

extension HomeViewController: BalanceCellDelegate {
    func onDeeplinkClicked(deeplink: String) {
        DeeplinkHandler(rootViewController: self.navigationController?.viewControllers.first).openDeeplink(string: deeplink)
    }
}

private extension HomeViewController {
    @objc
    func reloadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self else { return }
            // Tipo de mock pra reload
            interactor.loadSpecificData(jsonType: .moreInfoMock)
        }
    }
}
