//
//  TransactionItemView.swift
//  YellowBank
//
//  Created by André  Aragão on 20/03/25.
//
import UIKit

final class TransactionItemView: UIView {
    private lazy var titleText = DesignSystem.BaseComponents.toBaseText()
    private lazy var valueText = DesignSystem.BaseComponents.toBaseText()
    private lazy var iconImage = DesignSystem.BaseComponents.toImage()
    
    init(titleDTO: BaseTextDTO, value: String, imageName: ImageName) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        titleText.setDTO(dto: titleDTO)
        valueText.setDTO(dto: .init(text: value, fontSize: 12, textColor: .lightGray))
        iconImage.setDTO(dto: .init(imageName: imageName))
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
            iconImage.widthAnchor.constraint(equalToConstant: 35),
            iconImage.heightAnchor.constraint(equalToConstant: 35),
            iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),

            titleText.topAnchor.constraint(equalTo: iconImage.topAnchor),
            titleText.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 15),
            
            valueText.bottomAnchor.constraint(equalTo: iconImage.bottomAnchor),
            valueText.leadingAnchor.constraint(equalTo: titleText.leadingAnchor)
        ])
    }
}
