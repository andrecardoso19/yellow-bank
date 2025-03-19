//
//  BalanceActionButtonView.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

final class BalanceActionButtonView: UIView, BalanceActionButtonInterface {
    private var buttonHeightWidth: CGFloat = 60
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.backgroundColor = .clear
        button.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 0.3)
        button.layer.cornerRadius = buttonHeightWidth / 2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .clear
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    init() {
        super.init(frame: .zero)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDTO(dto: BalanceActionButtonDTO) {
        let imageComponent = DesignSystem.BaseComponents.toImage()
        imageComponent.setDTO(dto: ImageDTO(imageName: dto.imageName))
        button.setImage(imageComponent.image, for: .normal)
        titleLabel.text = dto.text.text
        titleLabel.font = .systemFont(ofSize: CGFloat(dto.text.fontSize), weight: .medium)
        titleLabel.textColor = UIColor(named: dto.text.color)
        buildLayout()
    }
    
    private func buildLayout() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(button)
        addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: buttonHeightWidth),
            button.widthAnchor.constraint(equalToConstant: buttonHeightWidth),
            
            titleLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 5)
        ])
    }
}
