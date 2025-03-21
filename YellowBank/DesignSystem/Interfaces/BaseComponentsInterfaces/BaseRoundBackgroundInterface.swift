//
//  BaseRoundBackgroundInterface.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

protocol BaseRoundBackgroundInterface: UIView {
    func setDTO(dto: BaseRoundBackgroundDTO)
}

struct BaseRoundBackgroundDTO {
    let backgroundColor: UIColor
}
