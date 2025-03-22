//
//  CreditCardInfoItemView.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

final class CreditCardInfoItemView: UIView, CreditCardInfoItemInterface {
    private lazy var backgroundRoundView = DesignSystem.BaseComponents.toBaseRoundBackground()
    private lazy var titleLabel = DesignSystem.BaseComponents.toBaseText()
    private lazy var subTitleLabel = DesignSystem.BaseComponents.toBaseText()
    private lazy var arrowImage = DesignSystem.BaseComponents.toImage()
    private lazy var valueLabel = DesignSystem.BaseComponents.toBaseText()
    private lazy var dueDateLabel = DesignSystem.BaseComponents.toBaseText()
    
    private lazy var cardFlagImageView: UIImageView = {
        let cardFlagImageView = UIImageView()
        cardFlagImageView.translatesAutoresizingMaskIntoConstraints = false
        return cardFlagImageView
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDTO(dto: CreditCardInfoItemDTO) {
        titleLabel.setDTO(
            dto: .init(
                text: dto.title.text,
                fontSize: CGFloat(dto.title.fontSize),
                textColor: .white
            )
        )
        subTitleLabel.setDTO(
            dto: .init(
                text: dto.subtitle.text,
                fontSize: CGFloat(dto.subtitle.fontSize),
                textColor: .white
            )
        )
        valueLabel.setDTO(
            dto: .init(
                text: dto.value.text,
                fontSize: CGFloat(dto.value.fontSize),
                textColor: .white
            )
        )
        dueDateLabel.setDTO(
            dto: .init(
                text: dto.dueDate.text,
                fontSize: CGFloat(dto.dueDate.fontSize),
                textColor: .white
            )
        )
        arrowImage.setDTO(dto: .init(imageName: .arrowRight, coror: .white))
        backgroundRoundView.setDTO(dto: .init(backgroundColor: .black.withAlphaComponent(0.9)))
        
        let imageComponent = DesignSystem.BaseComponents.toImage()
        imageComponent.setDTO(dto: .init(imageName: dto.icon))
        cardFlagImageView.image = imageComponent.image
        
        buildLayout()
    }
    
    private func buildLayout() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .clear
        addSubview(backgroundRoundView)
        backgroundRoundView.addSubview(cardFlagImageView)
        backgroundRoundView.addSubview(titleLabel)
        backgroundRoundView.addSubview(subTitleLabel)
        backgroundRoundView.addSubview(arrowImage)
        backgroundRoundView.addSubview(valueLabel)
        backgroundRoundView.addSubview(dueDateLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundRoundView.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacings.baseSpacing / 2),
            backgroundRoundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacings.baseSpacing / 2),
            backgroundRoundView.heightAnchor.constraint(equalToConstant: 75),
            backgroundRoundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacings.baseSpacing / 2),
            backgroundRoundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DSSpacings.baseSpacing / 2),
            
            cardFlagImageView.topAnchor.constraint(equalTo: backgroundRoundView.topAnchor, constant: DSSpacings.baseSpacing),
            cardFlagImageView.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: DSSpacings.baseSpacing),
//            cardFlagImageView.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: DSSpacings.baseSpacing / 2),
            cardFlagImageView.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing5x),
            cardFlagImageView.widthAnchor.constraint(equalToConstant: DSSpacings.baseSpacing5x),
            
            titleLabel.centerYAnchor.constraint(equalTo: cardFlagImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: cardFlagImageView.trailingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -DSSpacings.baseSpacing),
            titleLabel.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing2x),
            
            subTitleLabel.topAnchor.constraint(equalTo: cardFlagImageView.bottomAnchor, constant: -DSSpacings.baseSpacing),
//            subTitleLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: DSSpacings.baseSpacing),
            subTitleLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: DSSpacings.baseSpacing * 1.5),
            subTitleLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -DSSpacings.baseSpacing),
            subTitleLabel.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 3),
            
            valueLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: -DSSpacings.baseSpacing / 2),
//            valueLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: DSSpacings.baseSpacing),
            valueLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: DSSpacings.baseSpacing * 1.5),
            valueLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -DSSpacings.baseSpacing),
            valueLabel.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 3),
            
            dueDateLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: -DSSpacings.baseSpacing / 2),
//            dueDateLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: DSSpacings.baseSpacing),
            dueDateLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: DSSpacings.baseSpacing * 1.5),
            dueDateLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -DSSpacings.baseSpacing),
            dueDateLabel.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 3),
            
            arrowImage.topAnchor.constraint(equalTo: backgroundRoundView.topAnchor, constant: DSSpacings.baseSpacing / 2),
            arrowImage.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -DSSpacings.baseSpacing / 2),
            arrowImage.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 1.7),
            arrowImage.widthAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 1.2),
        ])
    }
}


