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
        
        sut.openDeeplink(string: "yellowbank://home")
        
        XCTAssertTrue(navigationController.viewControllers.last is HomeViewController)
    }
    
    func testDeeplinkNavigateTo_WhenHomeWithMoreDataScene_ShouldCallHomeWithMoreDataScene() {
        let viewController = UIViewController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        
        let sut = DeeplinkHandler(rootViewController: navigationController.topViewController)
        
        sut.openDeeplink(string: "yellowbank://homeMoreData")
        
        XCTAssertTrue(navigationController.viewControllers.last is HomeViewController)
    }
    
    func testDeeplinkNavigateTo_WhenHomeNoHeaderScene_ShouldCallHomeNoHeadereDataScene() {
        let viewController = UIViewController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        
        let sut = DeeplinkHandler(rootViewController: navigationController.topViewController)
        
        sut.openDeeplink(string: "yellowbank://homeNoHeader")
        
        XCTAssertTrue(navigationController.viewControllers.last is HomeViewController)
    }
    
    func testDeeplinkNavigateTo_WhenInvalidDeeplink_ShouldCallHomeScene() {
        let viewController = UIViewController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        
        let sut = DeeplinkHandler(rootViewController: navigationController.topViewController)
        
        sut.openDeeplink(string: "yellowbank://zzzzz")
        
        XCTAssertTrue(navigationController.viewControllers.last is HomeViewController)
    }
    
    func testDeeplinkNavigateTo_WhenTransferDeeplink_ShouldCallGenericScreen() {
        let viewController = UIViewController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        
        let sut = DeeplinkHandler(rootViewController: navigationController.topViewController)
        
        sut.openDeeplink(string: "yellowbank://transfer")
        
        XCTAssertTrue(navigationController.viewControllers.last is GenericViewController)
    }
    
    func testDeeplinkNavigateTo_WhenQrcodeDeeplink_ShouldCallGenericScreen() {
        let viewController = UIViewController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        
        let sut = DeeplinkHandler(rootViewController: navigationController.topViewController)
        
        sut.openDeeplink(string: "yellowbank://qrcode")
        
        XCTAssertTrue(navigationController.viewControllers.last is GenericViewController)
    }
    
    func testDeeplinkNavigateTo_WhenPixDeeplink_ShouldCallGenericScreen() {
        let viewController = UIViewController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        
        let sut = DeeplinkHandler(rootViewController: navigationController.topViewController)
        
        sut.openDeeplink(string: "yellowbank://pix")
        
        XCTAssertTrue(navigationController.viewControllers.last is GenericViewController)
    }
    
    func testDeeplinkNavigateTo_WhenChargeDeeplink_ShouldCallGenericScreen() {
        let viewController = UIViewController()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        
        let sut = DeeplinkHandler(rootViewController: navigationController.topViewController)
        
        sut.openDeeplink(string: "yellowbank://charge")
        
        XCTAssertTrue(navigationController.viewControllers.last is GenericViewController)
    }
}
