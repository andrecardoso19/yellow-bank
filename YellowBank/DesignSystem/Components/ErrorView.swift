//
//  ErrorView.swift
//  YellowBank
//
//  Created by André  Aragão on 20/03/25.
//
import UIKit

final class ErrorView: UIView, ErrorViewInterface {
    private lazy var errorView = DesignSystem.BaseComponents.toBaseRoundBackground()
    private lazy var errorImage = DesignSystem.BaseComponents.toImage()
    private lazy var errorLabel = DesignSystem.BaseComponents.toBaseText()
    private lazy var errorButton = DesignSystem.BaseComponents.toBalanceActionButton()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildLayout() {
        errorView.setDTO(dto: .init(backgroundColor: .white))
        errorImage.setDTO(dto: .init(imageName: .warning))
        errorLabel.setDTO(
            dto: .init(
                text: "Erro! \nNão foi possível realizar a solicitação.",
                fontSize: 14,
                textColor: .red,
                textAlignment: .center,
                numberOfLines: 0
            )
        )
        errorButton.setDTO(dto: .init(imageName: .arrowLeft, text: .init()))
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(errorView)
        addSubview(errorImage)
        addSubview(errorLabel)
        addSubview(errorButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            errorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            errorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            errorView.widthAnchor.constraint(equalToConstant: 320),
            errorView.heightAnchor.constraint(equalToConstant: 230),
            
            errorImage.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
            errorImage.topAnchor.constraint(equalTo: errorView.topAnchor, constant: 20),
            errorImage.heightAnchor.constraint(equalToConstant: 50),
            errorImage.widthAnchor.constraint(equalToConstant: 50),
            
            errorLabel.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
            errorLabel.topAnchor.constraint(equalTo: errorImage.bottomAnchor, constant: 10),
            errorLabel.widthAnchor.constraint(equalTo: errorView.widthAnchor, multiplier: 0.8),
            errorLabel.heightAnchor.constraint(equalToConstant: 50),
            
            errorButton.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
            errorButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 40)
        ])
    }
}

