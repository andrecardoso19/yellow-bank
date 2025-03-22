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
        }
        
        rootViewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}

enum DeeplinkScene: String {
    case home = "home"
    case homeWithMoreData = "homeMoreData"
    case homeNoHeader = "homeNoHeader"
}
