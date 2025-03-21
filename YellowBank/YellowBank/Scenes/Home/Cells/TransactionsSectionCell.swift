//
//  TransactionsSectionCell.swift
//  YellowBank
//
//  Created by André  Aragão on 20/03/25.
//
import UIKit

final class TransactionsSectionCell: UITableViewCell {
    static let reuseId = "TransactionsSectionCell"
    private lazy var balanceItem = DesignSystem.Components.toTransactionsSectionItem()
    
    override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String? = nil) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        buildLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    private func buildLayout() {
        balanceItem.removeFromSuperview()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .clear
        contentView.addSubview(balanceItem)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            balanceItem.topAnchor.constraint(equalTo: contentView.topAnchor),
            balanceItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            balanceItem.heightAnchor.constraint(equalToConstant: CGFloat(DSSpacings.baseSpacing10x.rawValue * 2.3)),
            balanceItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            balanceItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension TransactionsSectionCell: ConfigurableCell {
    typealias DTO = TransactionsSectionCellDTO
    
    func setup(with DTO: TransactionsSectionCellDTO) {
        balanceItem.setDTO(dto: .init(items: DTO.items))
        buildLayout()
    }
}

struct TransactionsSectionCellDTO {
    let items: [HomeBalanceItem]
}


