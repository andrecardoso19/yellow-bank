//
//  DesignSystem.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

import UIKit

enum DesignSystem {
    static func toGenericSectionItem() -> GenericSectionItemInterface {
        return GenericSectionItemView()
    }
    static func toBalanceItem() -> BalanceItemInterface {
        return BalanceItemView()
    }
    
    enum BaseComponents {
        static func toBalanceActionButton() -> BalanceActionButtonInterface {
            return BalanceActionButtonView()
        }
    }
}
