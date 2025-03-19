//
//  BalanceActionButtonView.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

final class BalanceActionButtonView: UIView {
    private lazy var backgroundRoundView: UIView = {
        let view = UIView()
        // alterar cor quando for circular
//        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "iphone"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "teste"
        titleLabel.font = .systemFont(ofSize: CGFloat(14), weight: .light)
        titleLabel.backgroundColor = .clear
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    init() {
        super.init(frame: .zero)
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildLayout() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(backgroundRoundView)
        backgroundRoundView.addSubview(button)
        backgroundRoundView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundRoundView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundRoundView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundRoundView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            backgroundRoundView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            
            button.centerXAnchor.constraint(equalTo: backgroundRoundView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: backgroundRoundView.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 60),
            
            titleLabel.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: button.bottomAnchor)
        ])
    }
}
