//
//  GenericSectionCell.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//
import UIKit

final class GenericSectionCell: UITableViewCell {
    static let reuseId = "GenericSectionCell"
    private var dto: GenericSectionCellDTO
    private lazy var genericSectionItem = DesignSystem.toGenericSectionItem()
    
    init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String? = nil, dto: GenericSectionCellDTO) {
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
            genericSectionItem.heightAnchor.constraint(equalToConstant: 70),
            genericSectionItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            genericSectionItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension GenericSectionCell: ConfigurableCell {
    typealias DTO = GenericSectionCellDTO
    
    func setup(with DTO: GenericSectionCellDTO) {
        genericSectionItem.setDTO(dto: .init(title: dto.title, subtitle: dto.subtitle))
        buildLayout()
    }
}

struct GenericSectionCellDTO {
    let title: HomeTitle
    let subtitle: HomeTitle
}
