//
//  ImageInterface.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

protocol ImageInterface: UIImageView {
    func setDTO(dto: ImageDTO)
}

struct ImageDTO {
    let imageName: ImageName
}
