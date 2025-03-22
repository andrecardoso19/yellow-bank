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
    let textAlignment: NSTextAlignment
    let numberOfLines: Int
    let fontWheight: UIFont.Weight
    
    init(
        text: String,
        fontSize: CGFloat,
        textColor: UIColor,
        textAlignment: NSTextAlignment = .left,
        numberOfLines: Int = 1,
        fontWheight: UIFont.Weight = .medium
    ) {
        self.text = text
        self.fontSize = fontSize
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.fontWheight = fontWheight
    }
}
