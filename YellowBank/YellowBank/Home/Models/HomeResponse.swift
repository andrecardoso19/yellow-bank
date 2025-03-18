//
//  HomeResponse.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

struct HomeResponse {
    let header: HomeHeader
    let items: [HomeItem]
}

struct HomeHeader {
    let title: HomeTitle
}

struct HomeTitle {
    let text: String
    let fontSize: Int
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case fontSize = "font_size"
    }
}
