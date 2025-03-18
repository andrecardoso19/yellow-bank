//
//  HomePresenterTests.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//
import XCTest

@testable import YellowBank

private class HomeDisplaySpy: HomeDisplaying {
    enum Message {
        case didNextStep
        case displaySomething
        case displayError
    }

    private(set) var messages: [Message] = []

    func displaySomething() {
        messages.append(.displaySomething)
    }

    func didNextStep() {
        messages.append(.didNextStep)
    }
    
    func displayError() {
        messages.append(.displayError)
    }
}

private extension NPSPresenterTests {
    typealias Doubles = (
        sut: HomePresenter,
        displaySpy: HomeDisplaySpy
    )

    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> Doubles {
        let displaySpy = HomeDisplaySpy()

        let sut = HomePresenter()
        sut.viewController = displaySpy

        return (sut, displaySpy)
    }
}

final class NPSPresenterTests: XCTestCase {
    func testDisplaySomething_WhenCalled_ShouldDisplayDisplaySomething() {
        let args = makeSUT()
        
        args.sut.displaySomething()
        
        XCTAssertEqual(args.displaySpy.messages, [.displaySomething])
    }
    
    func testDidNextStep_WhenCalled_ShouldCoordinatorSomething() {
        let args = makeSUT()
        
        args.sut.didNextStep()
        
        XCTAssertEqual(args.displaySpy.messages, [.displaySomething])
    }
    
    func testDisplayError_WhenCalled_ShouldDisplayError() {
        let args = makeSUT()
        
        args.sut.displayError()
        
        XCTAssertEqual(args.displaySpy.messages, [.displayError])
    }
}

