//
//  HomeItemIdType.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

enum HomeItemId: String, Decodable {
    case balanceSection = "balance_section"
    case genericSection = "generic_section"
    case creditCard = "credit_card"
    case transactionsSection = "transactions-section"
}


enum HomeItemType: String, Decodable {
    case balance = "balance"
    case genericSection = "generic_section"
    case creditCard = "credit_card"
    case transactions = "transactions"
}
