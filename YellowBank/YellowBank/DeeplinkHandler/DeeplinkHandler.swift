//
//  DeeplinkHandler.swift
//  YellowBank
//
//  Created by André  Aragão on 21/03/25.
//
import UIKit

protocol DeeplinkHandlerProtocol {
    func openDeeplink(string: String)
}


final class DeeplinkHandler: DeeplinkHandlerProtocol {
    weak var rootViewController: UIViewController?
    
    init(rootViewController: UIViewController?) {
        self.rootViewController = rootViewController
    }
    
    func openDeeplink(string: String) {
        // TODO: URLComponents
        let deeplinkScene = string.split(separator: "://")
        if deeplinkScene.count > 0, let scene: DeeplinkScene = DeeplinkScene(rawValue: "\(deeplinkScene[1])")  {
            deeplinkNavigateTo(scene: scene)
            return
        }
        deeplinkNavigateTo(scene: .home)
    }
}

private extension DeeplinkHandler {
    func deeplinkNavigateTo(scene: DeeplinkScene) {
        var viewController = HomeFactory.make()
        switch scene {
        case .home:
            viewController = HomeFactory.make()
        case .homeWithMoreData:
            viewController = HomeFactory.make(mockType: .moreInfoMock)
        case .homeNoHeader:
            viewController = HomeFactory.make(mockType: .noHeaderMock)
        case .pix:
            viewController = GenericViewController(productTitle: scene.rawValue)
        case .transfer:
            viewController = GenericViewController(productTitle: scene.rawValue)
        case .qrcode:
            viewController = GenericViewController(productTitle: scene.rawValue)
        case .charge:
            viewController = GenericViewController(productTitle: scene.rawValue)
        }
        
        rootViewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}

enum DeeplinkScene: String {
    case home = "home"
    case homeWithMoreData = "homeMoreData"
    case homeNoHeader = "homeNoHeader"
    case pix = "pix"
    case transfer = "transfer"
    case qrcode = "qrcode"
    case charge = "charge"
}
