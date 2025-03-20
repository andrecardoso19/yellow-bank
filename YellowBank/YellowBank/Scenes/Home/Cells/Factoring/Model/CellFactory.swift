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
    private(set) var wrappedInstance: CellMaker

    init(wrappedInstance: CellMaker) {
        self.wrappedInstance = wrappedInstance
    }

    func makeCell() -> UITableViewCell {
        wrappedInstance.makeCell()
    }
}
