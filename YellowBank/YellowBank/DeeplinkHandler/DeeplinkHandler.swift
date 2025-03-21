//
//  DeeplinkHandler.swift
//  YellowBank
//
//  Created by André  Aragão on 21/03/25.
//
import UIKit

protocol DeeplinkHandlerProtocol {
    func deeplinkNavigateTo(scene: DeeplinkScene)
}


final class DeeplinkHandler: DeeplinkHandlerProtocol {
    weak var rootViewController: UIViewController?
    
    init(rootViewController: UIViewController?) {
        self.rootViewController = rootViewController
    }
    
    func deeplinkNavigateTo(scene: DeeplinkScene) {
        var viewController = HomeFactory.make()
        switch scene {
        case .defaultScene:
            viewController = HomeFactory.make()
        case .home:
            viewController = HomeFactory.make()
        case .homeWithMoreData:
            viewController = HomeFactory.make(mockType: .moreInfoMock)
        case .homeNoHeader:
            viewController = HomeFactory.make(mockType: .noHeaderMock)
        }
        
        rootViewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}

enum DeeplinkScene: String {
    case defaultScene = ""
    case home = "home"
    case homeWithMoreData = "homeMoreData"
    case homeNoHeader = "homeNoHeader"
}
