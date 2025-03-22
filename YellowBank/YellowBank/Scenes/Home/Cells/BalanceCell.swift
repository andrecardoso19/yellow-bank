//
//  BalanceCell.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

protocol BalanceCellDelegate: AnyObject {
    func onDeeplinkClicked(deeplink: String)
}

final class BalanceCell: UITableViewCell {
    static let reuseId = "BalanceCell"
    weak var delegate: BalanceCellDelegate?
    private var dto: BalanceCellDTO
    private lazy var balanceItem = DesignSystem.Components.toBalanceItem()
    
    init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String? = nil, dto: BalanceCellDTO) {
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
        contentView.addSubview(balanceItem)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            balanceItem.topAnchor.constraint(equalTo: contentView.topAnchor),
            balanceItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            balanceItem.heightAnchor.constraint(equalToConstant: DSSpacings.baseSpacing10x * 1.85),
            balanceItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            balanceItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension BalanceCell: ConfigurableCell {
    typealias DTO = BalanceCellDTO
    
    func setup(with DTO: BalanceCellDTO) {
        balanceItem.setDTO(dto: .init(amount: DTO.amount, items: DTO.items))
        balanceItem.delegate = self
        buildLayout()
    }
}

extension BalanceCell: BalanceItemViewDelegate {
    func deeplinkClicked(deeplinkClicked: String) {
        delegate?.onDeeplinkClicked(deeplink: deeplinkClicked)
    }
}

struct BalanceCellDTO {
    let amount: HomeItemAmount
    let items: [HomeBalanceItem]
}

