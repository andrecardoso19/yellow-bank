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
    
    private lazy var jsonTextField: UITextField = {
        let jsonTextField = UITextField()
        jsonTextField.placeholder = "Digite o JSON aqui"
        jsonTextField.backgroundColor = .white
        jsonTextField.translatesAutoresizingMaskIntoConstraints = false
        return jsonTextField
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        buildLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        jsonTextField.text = ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildLayout() {
        setupLayer()
        setupViews()
        setupStackButtons()
        setupTextFieldMock()
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
            actionButtonStackView.heightAnchor.constraint(equalToConstant: CGFloat(actionButtonStackView.subviews.count * 60))
        ])
    }
}

private extension SplashHomeSelectionViewController {
    func setupLayer() {
        let backgroundLayer: CAGradientLayer = {
            let layer = CAGradientLayer()
            layer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            layer.colors = [CGColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1.0), UIColor.white.cgColor]
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
    
    func setupTextFieldMock() {
        let textFieldSendButton = UIButton()
        textFieldSendButton.backgroundColor = .tintColor
        textFieldSendButton.setTitle("Home com Mock digitado", for: .normal)
        textFieldSendButton.translatesAutoresizingMaskIntoConstraints = false
        
        let action = UIAction { [weak self] action in
            guard let self else { return }
            goToHomeWithTypedMock()
        }
        textFieldSendButton.addAction(action, for: .touchUpInside)
        
        actionButtonStackView.addArrangedSubview(jsonTextField)
        actionButtonStackView.addArrangedSubview(textFieldSendButton)
    }
    
    func goToHome(indexSelected: Int) {
        let factory = HomeFactory.make(mockType: homeTypes[indexSelected])
        navigationController?.pushViewController(factory, animated: true)
    }
    
    func goToHomeWithTypedMock() {
        if let textTyped = jsonTextField.text, !textTyped.isEmpty {
            let factory = HomeFactory.make(mockString: "\(textTyped)")
            navigationController?.pushViewController(factory, animated: true)
        }
    }
}
