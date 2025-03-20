//
//  SplashHomeSelectionViewController.swift
//  YellowBank
//
//  Created by André  Aragão on 20/03/25.
//
import UIKit

final class SplashHomeSelectionViewController: UIViewController {
    private let homeTypes: [JSONType] = FetchData.returnJsonTypes()
    
    private lazy var actionButtonStackView: UIStackView = {
        let actionButtonStackView = UIStackView()
        actionButtonStackView.axis = .vertical
        actionButtonStackView.distribution = .equalCentering
        actionButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        return actionButtonStackView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildLayout() {
        setupLayer()
        setupViews()
        setupStackButtons()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(actionButtonStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            actionButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButtonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            actionButtonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            actionButtonStackView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}

private extension SplashHomeSelectionViewController {
    func setupLayer() {
        let backgroundLayer: CAGradientLayer = {
            let layer = CAGradientLayer()
            layer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            layer.colors = [UIColor.orange.cgColor, UIColor.white.cgColor]
            return layer
        }()
        
        view.layer.addSublayer(backgroundLayer)
    }
    
    func setupStackButtons() {
        homeTypes.enumerated().forEach { [weak self] index, jsonType in
            guard let self else { return }
            let buttonView = UIButton()
            buttonView.backgroundColor = .tintColor
            buttonView.setTitle(jsonType.rawValue, for: .normal)
            buttonView.translatesAutoresizingMaskIntoConstraints = false
            
            let action = UIAction { [weak self] action in
                guard let self else { return }
                goToHome(indexSelected: index)
            }
            buttonView.addAction(action, for: .touchUpInside)
            
            actionButtonStackView.addArrangedSubview(buttonView)
        }
    }
    
    func goToHome(indexSelected: Int) {
        let factory = HomeFactory.make(mockType: homeTypes[indexSelected])
        navigationController?.pushViewController(factory, animated: true)
    }
}
