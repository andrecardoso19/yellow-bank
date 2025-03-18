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


struct HomeResponseMock {
    static let responseMock: HomeResponse = .init(
        header: HomeHeader(title: HomeTitle(text: "Olá, Pedro",
                                            fontSize: 24,
                                            color: "#CCCCCC")),
        items: [
            HomeItem(
                id: .balanceSection,
                type: .balance,
                content: HomeItemContent(
                    amount: .init(currencySymbol: "R$",
                                  value: .init(text: "90,93",
                                               fontSize: 28,
                                               color: "#000000")),
                    items: [
                        HomeBalanceItem(
                            id: "pix",
                            title: HomeTitle(text: "Pix",
                                             fontSize: 14,
                                             color: "#CCCCCC"),
                            icon: "pix-icon",
                            deeplink: "swiftbankapp://pix"
                        ),
                        HomeBalanceItem(
                            id: "transferir",
                            title: HomeTitle(text: "Transferir",
                                             fontSize: 14,
                                             color: "#CCCCCC"),
                            icon: "transfer-money-icon",
                            deeplink: nil
                        ),
                        HomeBalanceItem(
                            id: "qr-code",
                            title: HomeTitle(text: "QR-code",
                                             fontSize: 14,
                                             color: "#CCCCCC"),
                            icon: "qr-code-icon",
                            deeplink: nil
                        )
                    ],
                    title: nil,
                    subtitle: nil,
                    icon: nil,
                    value: nil,
                    dueDate: nil
                )
            ),
            HomeItem(
                id: .genericSection,
                type: .genericSection,
                content: HomeItemContent(
                    amount: nil,
                    items: nil,
                    title: HomeTitle(text: "Empréstimos",
                                     fontSize: 16,
                                     color: "#CCCCCC"),
                    subtitle: HomeTitle(text: "Simule seu crédito e antecipe seus planos",
                                        fontSize: 12,
                                        color: "#CCCCCC"),
                    icon: nil,
                    value: nil,
                    dueDate: nil
                )
            ),
            HomeItem(
                id: .creditCard,
                type: .creditCard,
                content: HomeItemContent(
                    amount: nil,
                    items: nil,
                    title: HomeTitle(text: "Cartão final 9999",
                                     fontSize: 16,
                                     color: "#CCCCCC"),
                    subtitle: HomeTitle(text: "Limite disponível",
                                        fontSize: 12,
                                        color: "#CCCCCC"),
                    icon: "master-card-icon",
                    value: HomeTitle(text: "R$ 9.074,00",
                                     fontSize: 17,
                                     color: "#CCCCCC"),
                    dueDate: HomeTitle(text: "Vence em 04/05",
                                       fontSize: 12,
                                       color: "#CCCCCC")
                )
            ),
            HomeItem(
                id: .genericSection,
                type: .genericSection,
                content: HomeItemContent(
                    amount: nil,
                    items: nil,
                    title: HomeTitle(text: "Poupança",
                                     fontSize: 16,
                                     color: "#CCCCCC"),
                    subtitle: HomeTitle(text: "Guarde dinheiro e realize grandes sonhos",
                                        fontSize: 12,
                                        color: "#CCCCCC"),
                    icon: nil,
                    value: nil,
                    dueDate: nil
                )
            ),
            HomeItem(
                id: .genericSection,
                type: .genericSection,
                content: HomeItemContent(
                    amount: nil,
                    items: nil,
                    title: HomeTitle(text: "Seguros",
                                     fontSize: 16,
                                     color: "#CCCCCC"),
                    subtitle: HomeTitle(text: "Mantenha protegido o que há de mais importante em sua vida",
                                        fontSize: 12,
                                        color: "#CCCCCC"),
                    icon: nil,
                    value: nil,
                    dueDate: nil
                )
            )
        ]
    )
}
