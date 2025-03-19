//
//  CreditCardInfoItemInterface.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

protocol CreditCardInfoItemInterface: UIView {
    func setDTO(dto: CreditCardInfoItemDTO)
}

struct CreditCardInfoItemDTO {
    let title: HomeTitle
    let subtitle: HomeTitle
    let value: HomeTitle
    let dueDate: HomeTitle
    let icon: ImageName
}
