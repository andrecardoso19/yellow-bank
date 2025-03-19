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
    private lazy var arrowImage = DesignSystem.BaseComponents.toBaseText()
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
        backgroundRoundView.setDTO(dto: .init(backgroundColor: .black))
        
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
            backgroundRoundView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundRoundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            backgroundRoundView.heightAnchor.constraint(equalToConstant: 75),
            backgroundRoundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            backgroundRoundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            cardFlagImageView.topAnchor.constraint(equalTo: backgroundRoundView.topAnchor, constant: 10),
            cardFlagImageView.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: 5),
            cardFlagImageView.heightAnchor.constraint(equalToConstant: 50),
            cardFlagImageView.widthAnchor.constraint(equalToConstant: 50),
            
            titleLabel.centerYAnchor.constraint(equalTo: cardFlagImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: cardFlagImageView.trailingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            subTitleLabel.topAnchor.constraint(equalTo: cardFlagImageView.bottomAnchor, constant: -10),
            subTitleLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: 10),
            subTitleLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -10),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            valueLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: -5),
            valueLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: 10),
            valueLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -10),
            valueLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dueDateLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: -5),
            dueDateLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: 10),
            dueDateLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -10),
            dueDateLabel.heightAnchor.constraint(equalToConstant: 30),
            
            arrowImage.topAnchor.constraint(equalTo: backgroundRoundView.topAnchor, constant: 5),
            arrowImage.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -5),
            arrowImage.heightAnchor.constraint(equalToConstant: 17),
            arrowImage.widthAnchor.constraint(equalToConstant: 12),
        ])
    }
}


