//
//  ErrorView.swift
//  YellowBank
//
//  Created by André  Aragão on 20/03/25.
//
import UIKit

protocol ErrorViewDelegate: AnyObject {
    func onReturnButtonClick()
}

final class ErrorView: UIView, ErrorViewInterface {
    weak var delegate: ErrorViewDelegate?
    private let buttonSize = DSSpacings.baseSpacing4x * 1.3
    private lazy var errorView = DesignSystem.BaseComponents.toBaseRoundBackground()
    private lazy var errorImage = DesignSystem.BaseComponents.toImage()
    private lazy var errorLabel = DesignSystem.BaseComponents.toBaseText()
    private lazy var buttonView: UIButton = {
        let imageComponent = DesignSystem.BaseComponents.toImage()
        imageComponent.setDTO(dto: ImageDTO(imageName: .arrowLeft))
        
        let buttonView = UIButton()
        buttonView.setImage(imageComponent.image, for: .normal)
        buttonView.imageView?.contentMode = .scaleAspectFill
        buttonView.tintColor = .black
        buttonView.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 0.3)
        buttonView.layer.cornerRadius = buttonSize / 2
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        let action = UIAction { [weak self] action in
            guard let self else { return }
            delegate?.onReturnButtonClick()
        }
        buttonView.addAction(action, for: .touchUpInside)
        return buttonView
    }()
    
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
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(errorView)
        addSubview(errorImage)
        addSubview(errorLabel)
        addSubview(buttonView)
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
            
            buttonView.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
            buttonView.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: DSSpacings.baseSpacing2x),
            buttonView.widthAnchor.constraint(equalToConstant: buttonSize),
            buttonView.heightAnchor.constraint(equalToConstant: buttonSize)
        ])
    }
}

