//
//  HomePresenter.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

import UIKit

protocol HomePresenting: AnyObject {
    func presentHome(homeResponse: HomeResponse)
    func presentHeader(header: HomeTitle)
    func displayError(error: HomeApiError)
    func removeHeader()
}

final class HomePresenter {
    weak var viewController: HomeDisplaying?
}

// MARK: - HomePresenting
extension HomePresenter: HomePresenting {
    func presentHome(homeResponse: HomeResponse) {
        var cells: [CellFactory] = []
        
        for item in homeResponse.items {
            switch item.id {
            case .balanceSection:
                cells.append(
                    presentBalanceSection(itemContent: item.content)
                )
            case .genericSection:
                cells.append(
                    presentGenericSection(itemContent: item.content)
                )
            case .creditCard:
                cells.append(
                    presentCreditCardSection(itemContent: item.content)
                )
            case .transactionsSection:
                cells.append(
                    presentTransactionsSection(itemContent: item.content)
                )
            }
        }
        
        viewController?.displayHome(cells: cells)
    }
    
    func presentHeader(header: HomeTitle) {
        viewController?.displayHeader(header: header)
    }
    
    func removeHeader() {
        viewController?.removeHeader()
    }
    
    func displayError(error: HomeApiError) {
        viewController?.displayError()
    }
}

private extension HomePresenter {
    func presentGenericSection(itemContent: HomeItemContent) -> CellFactory {
        let dto = GenericSectionCellDTO(
            title: itemContent.title ?? .init(),
            subtitle: itemContent.subtitle ?? .init()
        )
        return CellFactory(wrappedInstance: GenericSectionCellFactory(genericSectionCellDTO: dto))
    }
    
    func presentBalanceSection(itemContent: HomeItemContent) -> CellFactory {
        let dto = BalanceCellDTO(
            amount: itemContent.amount ?? .init(currencySymbol: "", value: .init()),
            items: itemContent.items ?? []
        )
        return CellFactory(wrappedInstance: BalanceCellFactory(balanceCellDTO: dto))
    }
    
    func presentCreditCardSection(itemContent: HomeItemContent) -> CellFactory {
        let dto = CreditCardInfoCellDTO(
            title: itemContent.title ?? .init(),
            subtitle: itemContent.subtitle ?? .init(),
            value: itemContent.value ?? .init(),
            dueDate: itemContent.dueDate ?? .init(),
            icon: itemContent.icon ?? .mastercardIcon
        )
        return CellFactory(wrappedInstance: CreditCardInfoCellFactory(creditCardInfoCellDto: dto))
    }
    
    func presentTransactionsSection(itemContent: HomeItemContent) -> CellFactory {
        let dto = TransactionsSectionCellDTO(
            amount: itemContent.amount ?? .init(currencySymbol: "", value: .init()),
            items: itemContent.items ?? []
        )
        return CellFactory(wrappedInstance: TransactionsSectionCellFactory(transactionsSectionCellDTO: dto))
    }
}
