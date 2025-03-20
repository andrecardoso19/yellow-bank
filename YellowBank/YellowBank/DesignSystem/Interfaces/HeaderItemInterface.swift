//
//  HeaderItemInterface.swift
//  YellowBank
//
//  Created by André  Aragão on 20/03/25.
//
import UIKit

protocol HeaderItemInterface: UIView {
    func setDTO(dto: HeaderItemDTO)
}

struct HeaderItemDTO {
    let title: HomeTitle
}
