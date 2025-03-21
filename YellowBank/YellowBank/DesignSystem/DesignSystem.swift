//
//  DesignSystem.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

import UIKit

enum DesignSystem {
    enum BaseComponents {
        static func toBalanceActionButton() -> BalanceActionButtonInterface {
            return BalanceActionButtonView()
        }
        static func toImage() -> ImageInterface {
            return YellowBankImage()
        }
        static func toBaseRoundBackground() -> BaseRoundBackgroundInterface {
            return BaseRoundBackgroundView()
        }
        static func toBaseText() -> BaseTextInterface {
            return BaseTextView()
        }
        static func toTransactionItem() -> TransactionItemInterface {
            return TransactionItemView()
        }
    }
    
    enum Components {
        static func toGenericSectionItem() -> GenericSectionItemInterface {
            return GenericSectionItemView()
        }
        static func toBalanceItem() -> BalanceItemInterface {
            return BalanceItemView()
        }
        static func toTransactionsSectionItem() -> TransactionsSectionItemInterface {
            return TransactionsSectionItemView()
        }
        static func toCreditCardInfoItem() -> CreditCardInfoItemInterface {
            return CreditCardInfoItemView()
        }
        static func toHeaderItem() -> HeaderItemInterface {
            return HeaderView()
        }
        static func toErrorView() -> ErrorViewInterface {
            return ErrorView()
        }
    }
}

enum DSSpacings: CGFloat {
    case baseSpacing = 10
    case baseSpacing2x = 20
    case baseSpacing4x = 40
    case baseSpacing5x = 50
    case baseSpacing10x = 100
}
