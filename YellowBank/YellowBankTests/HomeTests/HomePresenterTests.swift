//
//  HomePresenterTests.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//
import XCTest

@testable import YellowBank

private class HomeDisplaySpy: HomeDisplaying {
    enum Message: Equatable {
        case displayError
        case displayHome(cells: [UITableViewCell])
    }

    private(set) var messages: [Message] = []

    func displayHome(cells: [UITableViewCell]) {
        messages.append(.displayHome(cells: cells))
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
//    func testDisplaySomething_WhenCalled_ShouldDisplayDisplaySomething() {
//        let args = makeSUT()
//        let mock = HomeResponseMock.responseMockEachSectionType
//        let expectedCells: [UITableViewCell] = [
//            GenericSectionCell(dto: .init(
//                title: mock.items[1].content.title ?? .init(text: "", fontSize: 0, color: ""),
//                subtitle: mock.items[1].content.subtitle ?? .init(text: "", fontSize: 0, color: "")
//            ))
//        ]
//        
//        args.sut.presentHome(homeResponse: mock)
//        
//        XCTAssertEqual(args.displaySpy.messages, [.displayHome(cells: expectedCells)])
//    }
    
    func testDisplayError_WhenCalled_ShouldDisplayError() {
        let args = makeSUT()
        
        args.sut.displayError(error: .decodeFail)
        
        XCTAssertEqual(args.displaySpy.messages, [.displayError])
    }
}

