//
//  TransactionItemInterface.swift
//  YellowBank
//
//  Created by André  Aragão on 20/03/25.
//
import UIKit

protocol TransactionItemInterface: UIView {
    func setDTO(dto: TransactionItemDTO)
}

struct TransactionItemDTO {
    let titleDTO: BaseTextDTO
    let value: String
    let imageName: ImageName
}
