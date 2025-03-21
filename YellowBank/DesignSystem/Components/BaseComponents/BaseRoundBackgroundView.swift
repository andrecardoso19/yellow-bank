//
//  BaseRoundBackgroundView.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

final class BaseRoundBackgroundView: UIView, BaseRoundBackgroundInterface {
    func setDTO(dto: BaseRoundBackgroundDTO) {
        self.backgroundColor = dto.backgroundColor
        self.layer.cornerRadius = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width:0, height:0.5);
        self.layer.shadowRadius = 10;
        self.layer.shadowOpacity = 0.13;
    }
}
