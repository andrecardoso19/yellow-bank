//
//  GenericViewController.swift
//  YellowBank
//
//  Created by André  Aragão on 21/03/25.
//
import UIKit

final class GenericViewController: UIViewController {
    private var productTitle = String()
    
    init(productTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.productTitle = productTitle
        view.backgroundColor = .white
        title = "Futura tela de \(productTitle.capitalized)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
