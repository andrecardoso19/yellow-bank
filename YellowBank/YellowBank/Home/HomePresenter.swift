//
//  HomePresenter.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//

import UIKit

protocol HomePresenting: AnyObject {
    func presentHome(homeResponse: HomeResponse)
    func displayError(error: HomeApiError)
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
                break
            }
        }
        
        viewController?.displayHome(cells: cells)
    }
    
    func displayError(error: HomeApiError) {
        viewController?.displayError()
    }
}

private extension HomePresenter {
    func presentGenericSection(itemContent: HomeItemContent) -> CellFactory {
        let dto = GenericSectionCellDTO(
            title: HomeTitle(
                text: itemContent.title?.text ?? "",
                fontSize: itemContent.title?.fontSize ?? 0,
                color: itemContent.title?.color ?? ""
            ),
            subtitle: HomeTitle(
                text: itemContent.subtitle?.text ?? "",
                fontSize: itemContent.subtitle?.fontSize ?? 0,
                color: itemContent.subtitle?.color ?? ""
            )
        )
        return CellFactory(wrappedInstance: GenericSectionCellFactory(genericSectionCellDTO: dto))
    }
    
    func presentBalanceSection(itemContent: HomeItemContent) -> CellFactory {
        let dto = BalanceCellDTO(
            amount: itemContent.amount ?? .init(currencySymbol: "", value: .init(text: "", fontSize: 0, color: "")),
            items: itemContent.items ?? []
        )
        return CellFactory(wrappedInstance: BalanceCellFactory(balanceCellDTO: dto))
    }
}
