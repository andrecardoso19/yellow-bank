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
            errorView.widthAnchor.constraint(equalToConstant: DSSpacings.baseSpacing10x * 3.2),
            errorView.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing10x * 2.3),
            
            errorImage.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
            errorImage.topAnchor.constraint(equalTo: errorView.topAnchor, constant: DSSpacings.baseSpacing2x),
            errorImage.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing5x),
            errorImage.widthAnchor.constraint(equalToConstant: DSSpacings.baseSpacing5x),
            
            errorLabel.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
            errorLabel.topAnchor.constraint(equalTo: errorImage.bottomAnchor, constant: DSSpacings.baseSpacing),
            errorLabel.widthAnchor.constraint(equalTo: errorView.widthAnchor, multiplier: 0.8),
            errorLabel.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing5x),
            
            errorButton.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
            errorButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: DSSpacings.baseSpacing4x)
        ])
    }
}

