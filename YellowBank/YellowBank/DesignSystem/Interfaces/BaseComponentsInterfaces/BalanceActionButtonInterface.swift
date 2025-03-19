//
//  BalanceActionButtonInterface.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

protocol BalanceActionButtonInterface: UIView {
    func setDTO(dto: BalanceActionButtonDTO)
}

struct BalanceActionButtonDTO {
    let imageName: String
    let text: HomeTitle
}
