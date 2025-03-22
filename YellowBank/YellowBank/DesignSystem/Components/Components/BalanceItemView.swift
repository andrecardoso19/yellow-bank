//
//  BalanceItemView.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

protocol BalanceItemViewDelegate: AnyObject {
    func deeplinkClicked(deeplinkClicked: String)
}

final class BalanceItemView: UIView, BalanceItemInterface {
    weak var delegate: BalanceItemViewDelegate?
    private let baseSpacing = DSSpacings.baseSpacing
    private let baseMidSpacing = DSSpacings.baseSpacing / 2
    
    private lazy var backgroundRoundView = DesignSystem.BaseComponents.toBaseRoundBackground()
    private lazy var balanceLabel = DesignSystem.BaseComponents.toBaseText()
    private lazy var currencyLabel = DesignSystem.BaseComponents.toBaseText()
    private lazy var valueLabel = DesignSystem.BaseComponents.toBaseText()
    
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
        actionButtonStackView.axis = .horizontal
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
    
    func setDTO(dto: BalanceItemDTO) {
        balanceLabel.setDTO(
            dto: .init(
                text: "Conta",
                fontSize: 17,
                textColor: .black
            )
        )
        valueLabel.setDTO(
            dto: .init(
                text: dto.amount.value.text,
                fontSize: CGFloat(dto.amount.value.fontSize),
                textColor: UIColor(named: dto.amount.value.color) ?? .black,
                fontWheight: .semibold
            )
        )
        currencyLabel.setDTO(
            dto: .init(
                text: dto.amount.currencySymbol,
                fontSize: CGFloat(dto.amount.value.fontSize),
                textColor: UIColor(named: dto.amount.value.color) ?? .black,
                fontWheight: .semibold
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
            let actionButton = DesignSystem.BaseComponents.toBalanceActionButton()
            actionButton.setDTO(dto: .init(imageName: item.icon, text: item.title, deeplink: item.deeplink ?? ""))
            actionButton.delegate = self
            
            actionButtonStackView.addArrangedSubview(actionButton)
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
        backgroundRoundView.addSubview(currencyLabel)
        backgroundRoundView.addSubview(valueLabel)
        backgroundRoundView.addSubview(arrowImage)
        backgroundRoundView.addSubview(actionButtonStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundRoundView.topAnchor.constraint(equalTo: topAnchor, constant: baseMidSpacing),
            backgroundRoundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: baseMidSpacing),
            backgroundRoundView.heightAnchor.constraint(equalToConstant: 85),
            backgroundRoundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -baseMidSpacing),
            backgroundRoundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -baseMidSpacing),
            
            balanceLabel.topAnchor.constraint(equalTo: backgroundRoundView.topAnchor, constant: baseSpacing),
            balanceLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: baseSpacing * 1.2),
            balanceLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -baseSpacing),
            balanceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            currencyLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor),
            currencyLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: baseSpacing * 1.2),
            currencyLabel.heightAnchor.constraint(equalToConstant: 30),
            
            valueLabel.centerYAnchor.constraint(equalTo: currencyLabel.centerYAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: currencyLabel.trailingAnchor),
            
            arrowImage.topAnchor.constraint(equalTo: backgroundRoundView.topAnchor, constant: baseMidSpacing),
            arrowImage.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -baseMidSpacing),
            arrowImage.heightAnchor.constraint(equalToConstant: 17),
            arrowImage.widthAnchor.constraint(equalToConstant: 12),
            
            actionButtonStackView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: baseMidSpacing),
            actionButtonStackView.widthAnchor.constraint(equalTo: backgroundRoundView.widthAnchor),
            actionButtonStackView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

extension BalanceItemView: BalanceActionButtonViewDelegate {
    func onButtonDeeplinkClicked(deeplink: String) {
        delegate?.deeplinkClicked(deeplinkClicked: deeplink)
    }
}
