//
//  TransactionItemView.swift
//  YellowBank
//
//  Created by André  Aragão on 20/03/25.
//
import UIKit

final class TransactionItemView: UIView, TransactionItemInterface {
    func setDTO(dto: TransactionItemDTO) {
        titleText.setDTO(dto: dto.titleDTO)
        valueText.setDTO(dto: .init(text: dto.value, fontSize: 12, textColor: .lightGray))
        iconImage.setDTO(dto: .init(imageName: dto.imageName))
        buildLayout()
    }
    
    private lazy var titleText = DesignSystem.BaseComponents.toBaseText()
    private lazy var valueText = DesignSystem.BaseComponents.toBaseText()
    private lazy var iconImage = DesignSystem.BaseComponents.toImage()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildLayout() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(iconImage)
        addSubview(titleText)
        addSubview(valueText)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 3.5),
            iconImage.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 3.5),
            iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: DSSpacings.baseSpacing * 1.5),

            titleText.topAnchor.constraint(equalTo: iconImage.topAnchor),
            titleText.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: DSSpacings.baseSpacing * 1.5),
            
            valueText.bottomAnchor.constraint(equalTo: iconImage.bottomAnchor),
            valueText.leadingAnchor.constraint(equalTo: titleText.leadingAnchor)
        ])
    }
}
