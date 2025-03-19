//
//  BaseTextView.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

final class BaseTextView: UILabel, BaseTextInterface {
    func setDTO(dto: BaseTextDTO) {
        self.font = .systemFont(ofSize: CGFloat(dto.fontSize), weight: .medium)
        self.text = dto.text
        self.textColor = dto.textColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
