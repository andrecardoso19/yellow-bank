//
//  BalanceActionButtonInterface.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

protocol BalanceActionButtonInterface: UIView {
    var delegate: BalanceActionButtonViewDelegate? { get set }
    func setDTO(dto: BalanceActionButtonDTO)
}

struct BalanceActionButtonDTO {
    let imageName: ImageName
    let text: HomeTitle
    let deeplink: String
}
