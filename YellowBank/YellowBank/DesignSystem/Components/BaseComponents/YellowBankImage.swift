//
//  YellowBankImage.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

final class YellowBankImage: UIImageView, ImageInterface {
    func setDTO(dto: ImageDTO) {
        self.image = setupImage(imageName: dto.imageName)
    }
    
    private func setupImage(imageName: ImageName) -> UIImage {
        var image: UIImage = UIImage()
        switch imageName {
        case .pixIcon:
            image = UIImage(named: "pix") ?? UIImage()
        case .transferIcon:
            image = UIImage(systemName: "banknote") ?? UIImage()
        case .qrCodeIcon:
            image = UIImage(systemName: "qrcode") ?? UIImage()
        case .cellphoneIcon:
            image = UIImage(systemName: "iphone.and.arrow.left.and.arrow.right.inward") ?? UIImage()
        case .mastercardIcon:
            image = UIImage(systemName: "iphone") ?? UIImage()
        }
        return image
    }
}
