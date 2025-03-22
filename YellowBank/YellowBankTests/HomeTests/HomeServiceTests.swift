//
//  HomeServiceTests.swift
//  YellowBank
//
//  Created by André  Aragão on 22/03/25.
//
import XCTest
@testable import YellowBank

final class HomeServiceTests: XCTestCase {
    func testGetData_WhenSuccess_ShouldReturnResponse() {
        let sut: HomeServicing = HomeService(mockType: .defaultMock)
        
        sut.getData { result in
            XCTAssertTrue(result == .success(HomeResponseMock.responseMock))
        }
    }
    
    func testGetData_WhenHasMockStringAndSuccess_ShouldReturnResponse() {
        let sut: HomeServicing = HomeService(mockType: .defaultMock, mockString: DataSource.defaultJson)
        
        sut.getData { result in
            XCTAssertTrue(result == .success(HomeResponseMock.responseMock))
        }
    }
    
    func testGetData_WhenHasMockStringAndFailure_ShouldDecodeFail() {
        let sut: HomeServicing = HomeService(mockType: .defaultMock, mockString: "invalidData")
        
        sut.getData { result in
            XCTAssertTrue(result == .failure(.decodeFail))
        }
    }
    
    func testGetSpecificData_WhenSuccess_ShouldReturnResponse() {
        let sut: HomeServicing = HomeService(mockType: .defaultMock)
        
        sut.getSpecificData(jsonType: .defaultMock) { result in
            XCTAssertTrue(result == .success(HomeResponseMock.responseMock))
        }
    }
    
    func testGetSpecificData_WhenFailure_ShouldReturnDecodeFail() {
        let sut: HomeServicing = HomeService(mockType: .invalidData)
        
        sut.getSpecificData(jsonType: .invalidData) { result in
            XCTAssertTrue(result == .failure(.decodeFail))
        }
    }
}
