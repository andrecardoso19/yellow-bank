//
//  GenericSectionInterface.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//
import UIKit

protocol GenericSectionItemInterface: UIView {
    func setDTO(dto: GenericSectionItemDTO)
}

struct GenericSectionItemDTO {
    let title: HomeTitle
    let subtitle: HomeTitle
}
