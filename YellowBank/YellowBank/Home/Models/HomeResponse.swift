//
//  HomeResponse.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

struct HomeResponse: Decodable {
    let header: HomeHeader
    let items: [HomeItem]
}

struct HomeHeader: Decodable {
    let title: HomeTitle
}

struct HomeTitle: Decodable {
    let text: String
    let fontSize: Int
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case text, color
        case fontSize = "font_size"
    }
}
