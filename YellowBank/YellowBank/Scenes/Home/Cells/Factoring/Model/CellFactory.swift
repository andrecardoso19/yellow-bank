//
//  CellFactory.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

protocol ConfigurableCell: UITableViewCell {
    associatedtype DTO
    func setup(with DTO: DTO)
}

protocol CellMaker {
    func makeCell() -> UITableViewCell
}


final class CellFactory: CellMaker {
    private(set) var cellMaker: CellMaker
    
    init(cellMaker: CellMaker) {
        self.cellMaker = cellMaker
    }
    
    func makeCell() -> UITableViewCell {
        cellMaker.makeCell()
    }
}
