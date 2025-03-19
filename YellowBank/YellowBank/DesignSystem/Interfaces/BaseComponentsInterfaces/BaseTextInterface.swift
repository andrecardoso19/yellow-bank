//
//  BaseTextInterface.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

protocol BaseTextInterface: UIView {
    func setDTO(dto: BaseTextDTO)
}

struct BaseTextDTO {
    let text: String
    let fontSize: CGFloat
    let textColor: UIColor
}
