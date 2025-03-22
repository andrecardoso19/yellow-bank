//
//  TransactionsSectionItemView.swift
//  YellowBank
//
//  Created by André  Aragão on 20/03/25.
//
import UIKit

final class TransactionsSectionItemView: UIView, TransactionsSectionItemInterface {
    private lazy var backgroundRoundView = DesignSystem.BaseComponents.toBaseRoundBackground()
    private lazy var balanceLabel = DesignSystem.BaseComponents.toBaseText()
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView()
        let imageComponent = DesignSystem.BaseComponents.toImage()
        imageComponent.setDTO(dto: .init(imageName: .arrowRight))
        imageView.image = imageComponent.image
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var actionButtonStackView: UIStackView = {
        let actionButtonStackView = UIStackView()
        actionButtonStackView.axis = .vertical
        actionButtonStackView.distribution = .fillProportionally
        actionButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        return actionButtonStackView
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
    
    func setDTO(dto: TransactionsSectionItemDTO) {
        balanceLabel.setDTO(
            dto: .init(
                text: "Últimas Transações",
                fontSize: 17,
                textColor: .black,
                fontWheight: .bold
            )
        )
        backgroundRoundView.setDTO(
            dto: .init(
                backgroundColor: .white
            )
        )
        
        setupActionButtonItems(items: dto.items)
        
        buildLayout()
    }
    
    private func setupActionButtonItems(items: [HomeBalanceItem]) {
        for item in items {
            let transactionItem = DesignSystem.BaseComponents.toTransactionItem()
            transactionItem.setDTO(
                dto: .init(
                    titleDTO: .init(
                        text: item.title.text,
                        fontSize: CGFloat(item.title.fontSize),
                        textColor: UIColor(named: item.title.color) ?? .black
                    ),
                    value: item.id,
                    imageName: item.icon
                )
            )
            actionButtonStackView.addArrangedSubview(transactionItem)
            transactionItem.widthAnchor.constraint(equalTo: actionButtonStackView.widthAnchor).isActive = true
        }
    }
    
    private func buildLayout() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .clear
        addSubview(backgroundRoundView)
        backgroundRoundView.addSubview(balanceLabel)
        backgroundRoundView.addSubview(arrowImage)
        backgroundRoundView.addSubview(actionButtonStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundRoundView.topAnchor.constraint(equalTo: topAnchor, constant: DSSpacings.baseSpacing / 2),
            backgroundRoundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacings.baseSpacing / 2),
            backgroundRoundView.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 8.5),
            backgroundRoundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacings.baseSpacing / 2),
            backgroundRoundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DSSpacings.baseSpacing / 2),
            
            balanceLabel.topAnchor.constraint(equalTo: backgroundRoundView.topAnchor, constant: DSSpacings.baseSpacing),
            balanceLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: DSSpacings.baseSpacing * 1.2),
            balanceLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -DSSpacings.baseSpacing),
            
            arrowImage.topAnchor.constraint(equalTo: backgroundRoundView.topAnchor, constant: DSSpacings.baseSpacing / 2),
            arrowImage.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -DSSpacings.baseSpacing / 2),
            arrowImage.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 1.7),
            arrowImage.widthAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 1.2),
            
            actionButtonStackView.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: DSSpacings.baseSpacing),
            actionButtonStackView.widthAnchor.constraint(equalTo: backgroundRoundView.widthAnchor),
            actionButtonStackView.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing10x * 1.8)
        ])
    }
}
