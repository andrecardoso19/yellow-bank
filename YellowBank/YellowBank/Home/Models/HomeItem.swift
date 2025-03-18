//
//  HomeItem.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//
struct HomeItem {
    let id: HomeItemId
    let type: HomeItemType
    let content: HomeItemContent
}

struct HomeItemContent {
    let amount: HomeItemAmount?
    let items: [HomeBalanceItem]?
    
    let title: HomeTitle?
    let subtitle: HomeTitle?
    
    let icon: String?
    let value: HomeTitle?
    let dueDate: HomeTitle?
    
    enum CodingKeys: String, CodingKey {
        case dueDate = "due_date"
    }
}

struct HomeBalanceItem {
    let id: String
    let title: HomeTitle
    let icon: String
    let deeplink: String?
}

struct HomeItemAmount {
    let currencySymbol: String
    let value: HomeTitle
    
    enum CodingKeys: String, CodingKey {
        case currencySymbol = "currency_symbol"
    }
}
