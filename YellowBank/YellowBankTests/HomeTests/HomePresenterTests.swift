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
        case removeHeader
        case displayHeader(header: YellowBank.HomeTitle)
    }

    private(set) var messages: [Message] = []

    var displayHomeCount = 0
    var displayHomeCells: [CellFactory] = []
    func displayHome(cells: [CellFactory]) {
        displayHomeCount += 1
        displayHomeCells = cells
    }
    
    func displayError() {
        messages.append(.displayError)
    }
    
    func displayHeader(header: YellowBank.HomeTitle) {
        messages.append(.displayHeader(header: header))
    }
    
    func removeHeader() {
        messages.append(.removeHeader)
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
        let mock = HomeResponseMock.responseMockEachSectionType
        let expectedCells: [CellFactory] = [
            CellFactory(cellMaker: BalanceCellFactory(
                balanceCellDTO: .init(
                    amount: mock.items[0].content.amount ?? .init(currencySymbol: "", value: .init()),
                    items: mock.items[0].content.items ?? []
                )
            )),
            CellFactory(cellMaker: GenericSectionCellFactory(
                genericSectionCellDTO: .init(
                    title: mock.items[1].content.title ?? .init(),
                    subtitle: mock.items[1].content.subtitle ?? .init()
                )
            )),
            CellFactory(cellMaker: CreditCardInfoCellFactory(
                creditCardInfoCellDto: .init(
                    title: mock.items[2].content.title ?? .init(),
                    subtitle: mock.items[2].content.subtitle ?? .init(),
                    value: mock.items[2].content.value ?? .init(),
                    dueDate: mock.items[2].content.dueDate ?? .init(),
                    icon: mock.items[2].content.icon ?? .mastercardIcon
                )
            )),
            CellFactory(
                cellMaker: TransactionsSectionCellFactory(
                    transactionsSectionCellDTO: .init(
                        items: mock.items[3].content.items ?? []
                    )
                )
            )
        ]
        
        args.sut.presentHome(homeResponse: mock)
        
        XCTAssertEqual(args.displaySpy.displayHomeCount, 1)
        XCTAssertEqual(args.displaySpy.displayHomeCells.count, expectedCells.count)
    }
    
    func testDisplayError_WhenCalled_ShouldDisplayError() {
        let args = makeSUT()
        
        args.sut.displayError(error: .decodeFail)
        
        XCTAssertEqual(args.displaySpy.messages, [.displayError])
    }
    
    func testPresentHeader_WhenCalled_ShouldDisplayHeader() {
        let args = makeSUT()
        let homeTitle = HomeTitle(text: "header", fontSize: 24, color: "")
        
        args.sut.presentHeader(header: homeTitle)
        
        XCTAssertEqual(args.displaySpy.messages, [.displayHeader(header: homeTitle)])
    }
    
    func testRemoveHeader_WhenCalled_ShouldDisplayRemoveHeader() {
        let args = makeSUT()
        
        args.sut.removeHeader()
        
        XCTAssertEqual(args.displaySpy.messages, [.removeHeader])
    }
}

