//
//  CreditCardInfoCell.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

final class CreditCardInfoCell: UITableViewCell {
    static let reuseId = "CreditCardInfoCell"
    private var dto: CreditCardInfoCellDTO
    private lazy var genericSectionItem = DesignSystem.Components.toCreditCardInfoItem()
    
    init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String? = nil, dto: CreditCardInfoCellDTO) {
        self.dto = dto
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        buildLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    private func buildLayout() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .clear
        contentView.addSubview(genericSectionItem)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            genericSectionItem.topAnchor.constraint(equalTo: contentView.topAnchor),
            genericSectionItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genericSectionItem.heightAnchor.constraint(equalToConstant: 150),
            genericSectionItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            genericSectionItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension CreditCardInfoCell: ConfigurableCell {
    typealias DTO = CreditCardInfoCellDTO
    
    func setup(with DTO: CreditCardInfoCellDTO) {
        genericSectionItem.setDTO(dto: .init(title: dto.title, subtitle: dto.subtitle))
        buildLayout()
    }
}

struct CreditCardInfoCellDTO {
    let title: HomeTitle
    let subtitle: HomeTitle
    let value: HomeTitle
    let dueDate: HomeTitle
    let icon: ImageName
}

