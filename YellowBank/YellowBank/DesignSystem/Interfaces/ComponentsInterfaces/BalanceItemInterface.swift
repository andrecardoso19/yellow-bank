//
//  BalanceItemInterface.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

protocol BalanceItemInterface: UIView {
    func setDTO(dto: BalanceItemDTO)
}

struct BalanceItemDTO {
    let amount: HomeItemAmount
    let items: [HomeBalanceItem]
}
