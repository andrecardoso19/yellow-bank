//
//  BaseTextView.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

final class BaseTextView: UILabel, BaseTextInterface {
    func setDTO(dto: BaseTextDTO) {
        self.font = .systemFont(ofSize: CGFloat(dto.fontSize), weight: dto.fontWheight)
        self.text = dto.text
        self.textColor = dto.textColor
        self.numberOfLines = dto.numberOfLines
        self.textAlignment = dto.textAlignment
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
