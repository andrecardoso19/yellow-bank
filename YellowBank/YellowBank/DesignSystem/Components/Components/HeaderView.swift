//
//  HeaderView.swift
//  YellowBank
//
//  Created by André  Aragão on 20/03/25.
//
import UIKit

final class HeaderView: UIView, HeaderItemInterface {
    private lazy var headerTextLabel = DesignSystem.BaseComponents.toBaseText()
    
    private lazy var notificationButton: UIButton = {
        let notificationButton = UIButton(type: .system)
        notificationButton.tintColor = .black
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        let imageComponent = DesignSystem.BaseComponents.toImage()
        imageComponent.setDTO(dto: ImageDTO(imageName: .notificationBadge))
        notificationButton.setImage(imageComponent.image, for: .normal)
        notificationButton.imageView?.contentMode = .scaleAspectFill
        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        return notificationButton
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDTO(dto: HeaderItemDTO) {
        headerTextLabel.setDTO(dto: .init(text: dto.title.text, fontSize: CGFloat(dto.title.fontSize), textColor: .white))
    }
    
    func buildLayout() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(headerTextLabel)
        addSubview(notificationButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headerTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            headerTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: DSSpacings.baseSpacing),
            
            notificationButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            notificationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            notificationButton.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 7),
            notificationButton.widthAnchor.constraint(equalToConstant: DSSpacings.baseSpacing * 7)
        ])
    }
}
