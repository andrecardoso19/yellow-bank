//
//  DeeplinkHandlerTests.swift
//  YellowBank
//
//  Created by André  Aragão on 21/03/25.
//
import XCTest

@testable import YellowBank

final class DeeplinkHandlerTests: XCTestCase {
    func testDeeplinkNavigateTo_WhenHomeScene_ShouldCallHomeScene() {
        let viewController = UIViewController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        
        let sut = DeeplinkHandler(rootViewController: navigationController.topViewController)
        
        sut.deeplinkNavigateTo(scene: .home)
        
        XCTAssertTrue(navigationController.viewControllers.last is HomeViewController)
    }
    
    func testDeeplinkNavigateTo_WhenHomeWithMoreDataScene_ShouldCallHomeWithMoreDataScene() {
        let viewController = UIViewController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        
        let sut = DeeplinkHandler(rootViewController: navigationController.topViewController)
        
        sut.deeplinkNavigateTo(scene: .homeWithMoreData)
        
        XCTAssertTrue(navigationController.viewControllers.last is HomeViewController)
    }
    
    func testDeeplinkNavigateTo_WhenHomeNoHeaderScene_ShouldCallHomeNoHeadereDataScene() {
        let viewController = UIViewController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        
        let sut = DeeplinkHandler(rootViewController: navigationController.topViewController)
        
        sut.deeplinkNavigateTo(scene: .homeNoHeader)
        
        XCTAssertTrue(navigationController.viewControllers.last is HomeViewController)
    }
}
