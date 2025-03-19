//
//  CreditCardInfoItemView.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

final class CreditCardInfoItemView: UIView, CreditCardInfoItemInterface {
    private var dto: CreditCardInfoItemDTO
    
    private lazy var backgroundRoundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width:0, height:0.5);
        view.layer.shadowRadius = 10;
        view.layer.shadowOpacity = 0.13;
        return view
    }()
    
    private lazy var cardFlagImageView: UIImageView = {
        let cardFlagImageView = UIImageView()
        cardFlagImageView.translatesAutoresizingMaskIntoConstraints = false
        return cardFlagImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subTitleLabel
    }()
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView()
        let imageComponent = DesignSystem.BaseComponents.toImage()
        imageComponent.setDTO(dto: .init(imageName: .arrowRight))
        imageView.image = imageComponent.image
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        return valueLabel
    }()
    
    private lazy var dueDateLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        return valueLabel
    }()
    
    init() {
        dto = CreditCardInfoItemDTO(
            title: .init(),
            subtitle: .init(),
            value: .init(),
            dueDate: .init(),
            icon: .mastercardIcon
        )
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
        self.dto = dto
        
        titleLabel.font = .systemFont(ofSize: CGFloat(dto.title.fontSize), weight: .medium)
        titleLabel.text = dto.title.text
        titleLabel.textColor = .white
        
        subTitleLabel.font = .systemFont(ofSize: CGFloat(dto.subtitle.fontSize), weight: .medium)
        subTitleLabel.text = dto.subtitle.text
        subTitleLabel.textColor = .white
        
        valueLabel.font = .systemFont(ofSize: CGFloat(dto.value.fontSize), weight: .medium)
        valueLabel.text = dto.value.text
        valueLabel.textColor = .white
        
        dueDateLabel.font = .systemFont(ofSize: CGFloat(dto.dueDate.fontSize), weight: .medium)
        dueDateLabel.text = dto.dueDate.text
        dueDateLabel.textColor = .white
        
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


