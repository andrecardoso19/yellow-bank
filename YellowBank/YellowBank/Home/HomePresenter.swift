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
        var cells: [UITableViewCell] = []
        
        for item in homeResponse.items {
            switch item.id {
            case .balanceSection:
                break
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
    func presentGenericSection(itemContent: HomeItemContent) -> GenericSectionCell {
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
        return GenericSectionCell(dto: dto)
    }
}
