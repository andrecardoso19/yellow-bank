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
