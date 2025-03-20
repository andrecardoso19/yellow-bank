//
//  TransactionsSectionInterface.swift
//  YellowBank
//
//  Created by André  Aragão on 20/03/25.
//
import UIKit

protocol TransactionsSectionItemInterface: UIView {
    func setDTO(dto: TransactionsSectionItemDTO)
}

struct TransactionsSectionItemDTO {
    let amount: HomeItemAmount
    let items: [HomeBalanceItem]
}
