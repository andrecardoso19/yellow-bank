//
//  GenericSectionItemView.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//
import UIKit

final class GenericSectionItemView: UIView, GenericSectionItemInterface {
    private lazy var backgroundRoundView = DesignSystem.BaseComponents.toBaseRoundBackground()
    private lazy var titleLabel = DesignSystem.BaseComponents.toBaseText()
    private lazy var subTitleLabel = DesignSystem.BaseComponents.toBaseText()
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView()
        let imageComponent = DesignSystem.BaseComponents.toImage()
        imageComponent.setDTO(dto: .init(imageName: .arrowRight))
        imageView.image = imageComponent.image
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    func setDTO(dto: GenericSectionItemDTO) {
        titleLabel.setDTO(
            dto: .init(
                text: dto.title.text,
                fontSize: CGFloat(dto.title.fontSize),
                textColor: UIColor(named: dto.title.color) ?? .black
            )
        )
        subTitleLabel.setDTO(
            dto: .init(
                text: dto.subtitle.text,
                fontSize: CGFloat(dto.subtitle.fontSize),
                textColor: UIColor(named: dto.subtitle.color) ?? .black
            )
        )
        backgroundRoundView.setDTO(dto: .init(backgroundColor: .white))
        
        buildLayout()
    }
    
    private func buildLayout() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .clear
        addSubview(backgroundRoundView)
        backgroundRoundView.addSubview(titleLabel)
        backgroundRoundView.addSubview(subTitleLabel)
        backgroundRoundView.addSubview(arrowImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundRoundView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundRoundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            backgroundRoundView.heightAnchor.constraint(equalToConstant: 75),
            backgroundRoundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            backgroundRoundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundRoundView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: 10),
            subTitleLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -10),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            arrowImage.topAnchor.constraint(equalTo: backgroundRoundView.topAnchor, constant: 5),
            arrowImage.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -5),
            arrowImage.heightAnchor.constraint(equalToConstant: 17),
            arrowImage.widthAnchor.constraint(equalToConstant: 12),
        ])
    }
}

