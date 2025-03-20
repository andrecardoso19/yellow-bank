//
//  CellFactories.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

struct GenericSectionCellFactory: CellMaker, Equatable {
    typealias Cell = GenericSectionCell

    private let genericSectionCellDTO: Cell.DTO

    init(genericSectionCellDTO: Cell.DTO) {
        self.genericSectionCellDTO = genericSectionCellDTO
    }

    func makeHeader(for tableView: UITableView) -> UIView {
        .init()
    }

    func makeCell() -> UITableViewCell {
        let cell = GenericSectionCell(dto: genericSectionCellDTO)
        cell.setup(with: genericSectionCellDTO)
        return cell
    }

    static func == (lhs: GenericSectionCellFactory, rhs: GenericSectionCellFactory) -> Bool {
        lhs.genericSectionCellDTO.title.text == rhs.genericSectionCellDTO.title.text
    }
}

struct BalanceCellFactory: CellMaker, Equatable {
    typealias Cell = BalanceCell

    private let balanceCellDTO: Cell.DTO

    init(balanceCellDTO: Cell.DTO) {
        self.balanceCellDTO = balanceCellDTO
    }

    func makeHeader(for tableView: UITableView) -> UIView {
        .init()
    }

    func makeCell() -> UITableViewCell {
        let cell = BalanceCell(dto: balanceCellDTO)
        cell.setup(with: balanceCellDTO)
        return cell
    }

    static func == (lhs: BalanceCellFactory, rhs: BalanceCellFactory) -> Bool {
        lhs.balanceCellDTO.amount.value.text == rhs.balanceCellDTO.amount.value.text
    }
}

struct CreditCardInfoCellFactory: CellMaker, Equatable {
    typealias Cell = CreditCardInfoCell

    private let creditCardInfoCellDto: Cell.DTO

    init(creditCardInfoCellDto: Cell.DTO) {
        self.creditCardInfoCellDto = creditCardInfoCellDto
    }

    func makeHeader(for tableView: UITableView) -> UIView {
        .init()
    }

    func makeCell() -> UITableViewCell {
        let cell = CreditCardInfoCell(dto: creditCardInfoCellDto)
        cell.setup(with: creditCardInfoCellDto)
        return cell
    }

    static func == (lhs: CreditCardInfoCellFactory, rhs: CreditCardInfoCellFactory) -> Bool {
        lhs.creditCardInfoCellDto.title.text == rhs.creditCardInfoCellDto.title.text
    }
}
