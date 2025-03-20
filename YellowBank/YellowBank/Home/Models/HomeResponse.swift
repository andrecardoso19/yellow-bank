//
//  HomeResponse.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

struct HomeResponse: Equatable, Decodable {
    static func == (lhs: HomeResponse, rhs: HomeResponse) -> Bool {
        lhs.header == rhs.header && lhs.items == rhs.items
    }
    
    let header: HomeHeader
    let items: [HomeItem]
}

struct HomeHeader: Decodable, Equatable {
    static func == (lhs: HomeHeader, rhs: HomeHeader) -> Bool {
        lhs.title.text == rhs.title.text
    }
    
    let title: HomeTitle
}

struct HomeTitle: Equatable, Decodable {
    let text: String
    let fontSize: Int
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case text, color
        case fontSize = "font_size"
    }
    
    init(text: String = "", fontSize: Int = 0, color: String = "") {
        self.text = text
        self.fontSize = fontSize
        self.color = color
    }
}
