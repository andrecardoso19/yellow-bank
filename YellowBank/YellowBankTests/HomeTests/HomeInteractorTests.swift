//
//  HomeInteractorTests.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//
import XCTest

@testable import YellowBank

private class HomePresenterSpy: HomePresenting {
    enum Message {
        case didNextStep
        case displaySomething
    }

    private(set) var messages: [Message] = []

    func displaySomething() {
        messages.append(.displaySomething)
    }

    func didNextStep() {
        messages.append(.didNextStep)
    }
}

private class HomeServiceMock: HomeServicing {
    // a fazer
}

private extension HomeInteractorTests {
    typealias Args = (
        sut: HomeInteractor,
        presenterSpy: HomePresenterSpy,
        serviceMock: HomeServiceMock
    )

    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> Args {
        let presenterSpy = HomePresenterSpy()
        let serviceMock = HomeServiceMock()

        let sut = HomeInteractor(
            service: serviceMock,
            presenter: presenterSpy
        )

        return (sut, presenterSpy, serviceMock)
    }
}

final class HomeInteractorTests: XCTestCase {
    func testLoadSomething_WhenCalled_ShouldPresenterDisplaySomething() {
        let args = makeSUT()
        
        args.sut.loadSomething()
        
        XCTAssertEqual(args.presenterSpy.messages, [.displaySomething])
    }
}
