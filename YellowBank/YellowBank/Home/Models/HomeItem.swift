//
//  HomeItem.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//
struct HomeItem: Decodable, Equatable {
    static func == (lhs: HomeItem, rhs: HomeItem) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: HomeItemId
    let type: HomeItemType
    let content: HomeItemContent
}

struct HomeItemContent: Decodable {
    let amount: HomeItemAmount?
    let items: [HomeBalanceItem]?
    
    let title: HomeTitle?
    let subtitle: HomeTitle?
    
    let icon: String?
    let value: HomeTitle?
    let dueDate: HomeTitle?
    
    enum CodingKeys: String, CodingKey {
        case amount, items, title, subtitle, icon, value
        case dueDate = "due_date"
    }
}

struct HomeBalanceItem: Decodable {
    let id: String
    let title: HomeTitle
    let icon: ImageName
    let deeplink: String?
}

struct HomeItemAmount: Decodable {
    let currencySymbol: String
    let value: HomeTitle
    
    enum CodingKeys: String, CodingKey {
        case value
        case currencySymbol = "currency_symbol"
    }
}
