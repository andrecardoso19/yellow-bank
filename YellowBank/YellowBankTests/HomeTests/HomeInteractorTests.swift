//
//  HomeInteractorTests.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//
import XCTest

@testable import YellowBank

private class HomePresenterSpy: HomePresenting {
    var presentHomeCount = 0
    var presentHomeResponse: HomeResponse = HomeResponseMock.responseMockEmpty
    func presentHome(homeResponse: YellowBank.HomeResponse) {
        presentHomeCount += 1
        presentHomeResponse = homeResponse
    }
    
    var displayErrorCount = 0
    var displayErrorType = HomeApiError.decodeFail
    func displayError(error: YellowBank.HomeApiError) {
        displayErrorCount += 1
        displayErrorType = error
    }
    
    var presentHeaderCount = 0
    var headerPresented: YellowBank.HomeTitle = .init()
    func presentHeader(header: YellowBank.HomeTitle) {
        presentHeaderCount += 1
        headerPresented = header
    }
    
    var removeHeaderCount = 0
    func removeHeader() {
        removeHeaderCount += 1
    }
    
    var stopLoadingCount = 0
    func stopLoading() {
        stopLoadingCount += 1
    }
}

private class HomeServiceMock: HomeServicing {
    var getDataResult: Result<YellowBank.HomeResponse, YellowBank.HomeApiError> = .failure(.decodeFail)
    func getData(completion: @escaping (Result<YellowBank.HomeResponse, YellowBank.HomeApiError>) -> Void) {
        completion(getDataResult)
    }
    
    func getSpecificData(jsonType: YellowBank.JSONType, completion: @escaping (Result<YellowBank.HomeResponse, YellowBank.HomeApiError>) -> Void) {
        completion(getDataResult)
    }
}

private extension HomeInteractorTests {
    typealias Doubles = (
        sut: HomeInteractor,
        presenterSpy: HomePresenterSpy,
        serviceMock: HomeServiceMock
    )

    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> Doubles {
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
    func testLoadData_WhenFailure_ShouldPresenterDisplayError() {
        let args = makeSUT()
        
        args.serviceMock.getDataResult = .failure(.decodeFail)
        args.sut.loadData()
        
        XCTAssertEqual(args.presenterSpy.displayErrorCount, 1)
        XCTAssertEqual(args.presenterSpy.displayErrorType, .decodeFail)
        XCTAssertEqual(args.presenterSpy.stopLoadingCount, 1)
    }
    
    func testLoadData_WhenSuccess_ShouldPresenterDisplayHomeAndHeader() {
        let args = makeSUT()
        let responseMock = HomeResponseMock.responseMock
        
        args.serviceMock.getDataResult = .success(responseMock)
        args.sut.loadData()
        
        XCTAssertEqual(args.presenterSpy.presentHomeCount, 1)
        XCTAssertEqual(args.presenterSpy.presentHomeResponse, responseMock)
        XCTAssertEqual(args.presenterSpy.presentHeaderCount, 1)
        XCTAssertEqual(args.presenterSpy.headerPresented, responseMock.header?.title)
        XCTAssertEqual(args.presenterSpy.stopLoadingCount, 1)
    }
    
    func testLoadData_WhenSuccessNoHeader_ShouldPresenterDisplayHomeAndRemoveHeader() {
        let args = makeSUT()
        let responseMock = HomeResponseMock.responseMockNoHeader
        
        args.serviceMock.getDataResult = .success(responseMock)
        args.sut.loadData()
        
        XCTAssertEqual(args.presenterSpy.presentHomeCount, 1)
        XCTAssertEqual(args.presenterSpy.presentHomeResponse, responseMock)
        XCTAssertEqual(args.presenterSpy.removeHeaderCount, 1)
        XCTAssertEqual(args.presenterSpy.stopLoadingCount, 1)
    }
    
    func testLoadData_WhenSuccessWithHeader_ThenSuccessNoHeader_ShouldPresenterPresentHomeAndRemoveHeader() {
        let args = makeSUT()
        let responseMock = HomeResponseMock.responseMock
        let responseMockEmptyHeader = HomeResponseMock.responseMockNoHeader
        
        args.serviceMock.getDataResult = .success(responseMock)
        args.sut.loadData()
        
        XCTAssertEqual(args.presenterSpy.presentHomeCount, 1)
        XCTAssertEqual(args.presenterSpy.presentHomeResponse, responseMock)
        XCTAssertEqual(args.presenterSpy.presentHeaderCount, 1)
        XCTAssertEqual(args.presenterSpy.headerPresented, responseMock.header?.title)
        XCTAssertEqual(args.presenterSpy.stopLoadingCount, 1)
        
        args.serviceMock.getDataResult = .success(responseMockEmptyHeader)
        args.sut.loadData()
        
        XCTAssertEqual(args.presenterSpy.presentHomeCount, 2)
        XCTAssertEqual(args.presenterSpy.presentHomeResponse, responseMockEmptyHeader)
        XCTAssertEqual(args.presenterSpy.removeHeaderCount, 1)
        XCTAssertEqual(args.presenterSpy.stopLoadingCount, 2)
    }
    
    func testLoadData_WhenSuccessAndItemsEmpty_ShouldPresenterDisplayError() {
        let args = makeSUT()
        let responseMock = HomeResponseMock.responseMockEmpty
        
        args.serviceMock.getDataResult = .success(responseMock)
        args.sut.loadData()
        
        XCTAssertEqual(args.presenterSpy.displayErrorCount, 1)
        XCTAssertEqual(args.presenterSpy.displayErrorType, .emptyData)
        XCTAssertEqual(args.presenterSpy.stopLoadingCount, 1)
    }
    
    func testReloadData_WhenSuccess_ShouldPresentHomeAndStopLoading() {
        let args = makeSUT()
        let responseMock = HomeResponseMock.responseMock
        
        args.serviceMock.getDataResult = .success(responseMock)
        args.sut.loadSpecificData(jsonType: .defaultMock)
        
        XCTAssertEqual(args.presenterSpy.presentHomeResponse, responseMock)
        XCTAssertEqual(args.presenterSpy.presentHomeCount, 1)
        XCTAssertEqual(args.presenterSpy.stopLoadingCount, 1)
    }
    
    func testReloadData_WhenFailure_ShouldPresentErrorAndStopLoading() {
        let args = makeSUT()
        
        args.serviceMock.getDataResult = .failure(.decodeFail)
        args.sut.loadSpecificData(jsonType: .defaultMock)
        
        XCTAssertEqual(args.presenterSpy.displayErrorType, .decodeFail)
        XCTAssertEqual(args.presenterSpy.displayErrorCount, 1)
        XCTAssertEqual(args.presenterSpy.stopLoadingCount, 1)
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
                            icon: ImageName.pixIcon,
                            deeplink: "swiftbankapp://pix"
                        ),
                        HomeBalanceItem(
                            id: "transferir",
                            title: HomeTitle(text: "Transferir",
                                             fontSize: 14,
                                             color: "#CCCCCC"),
                            icon: ImageName.transferIcon,
                            deeplink: nil
                        ),
                        HomeBalanceItem(
                            id: "qr-code",
                            title: HomeTitle(text: "QR-code",
                                             fontSize: 14,
                                             color: "#CCCCCC"),
                            icon: ImageName.qrCodeIcon,
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
                    icon: ImageName.mastercardIcon,
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
    
    static let responseMockEmpty: HomeResponse = .init(
        header: HomeHeader(title: HomeTitle(text: "", fontSize: 0, color: "")),
        items: []
    )
    
    static let responseMockEachSectionType: HomeResponse = .init(
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
                            icon: ImageName.pixIcon,
                            deeplink: "swiftbankapp://pix"
                        ),
                        HomeBalanceItem(
                            id: "transferir",
                            title: HomeTitle(text: "Transferir",
                                             fontSize: 14,
                                             color: "#CCCCCC"),
                            icon: ImageName.transferIcon,
                            deeplink: nil
                        ),
                        HomeBalanceItem(
                            id: "qr-code",
                            title: HomeTitle(text: "QR-code",
                                             fontSize: 14,
                                             color: "#CCCCCC"),
                            icon: ImageName.qrCodeIcon,
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
                    icon: ImageName.mastercardIcon,
                    value: HomeTitle(text: "R$ 9.074,00",
                                     fontSize: 17,
                                     color: "#CCCCCC"),
                    dueDate: HomeTitle(text: "Vence em 04/05",
                                       fontSize: 12,
                                       color: "#CCCCCC")
                )
            ),
            HomeItem(
                id: .transactionsSection,
                type: .transactions,
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
    
    static let responseMockNoHeader: HomeResponse = .init(
        header: HomeHeader(title: HomeTitle(text: "",
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
                            icon: ImageName.pixIcon,
                            deeplink: "swiftbankapp://pix"
                        ),
                        HomeBalanceItem(
                            id: "transferir",
                            title: HomeTitle(text: "Transferir",
                                             fontSize: 14,
                                             color: "#CCCCCC"),
                            icon: ImageName.transferIcon,
                            deeplink: nil
                        ),
                        HomeBalanceItem(
                            id: "qr-code",
                            title: HomeTitle(text: "QR-code",
                                             fontSize: 14,
                                             color: "#CCCCCC"),
                            icon: ImageName.qrCodeIcon,
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
                    icon: ImageName.mastercardIcon,
                    value: HomeTitle(text: "R$ 9.074,00",
                                     fontSize: 17,
                                     color: "#CCCCCC"),
                    dueDate: HomeTitle(text: "Vence em 04/05",
                                       fontSize: 12,
                                       color: "#CCCCCC")
                )
            )
        ]
    )
}
