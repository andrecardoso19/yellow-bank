//
//  BalanceItemView.swift
//  YellowBank
//
//  Created by André  Aragão on 19/03/25.
//
import UIKit

final class BalanceItemView: UIView, BalanceItemInterface {
    private var dto: BalanceItemDTO
    
    private lazy var backgroundRoundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var balanceLabel: UILabel = {
        let balanceLabel = UILabel()
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        return balanceLabel
    }()
    
    private lazy var valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        return valueLabel
    }()
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "arrow.right"))
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init() {
        dto = BalanceItemDTO(
            amount: .init(currencySymbol: "", value: .init(text: "", fontSize: 0, color: "")),
            items: []
        )
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        buildLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDTO(dto: BalanceItemDTO) {
        self.dto = dto
        
        balanceLabel.font = .systemFont(ofSize: CGFloat(17), weight: .medium)
        balanceLabel.text = "Conta"
        balanceLabel.textColor = .black
        
        valueLabel.font = .systemFont(ofSize: CGFloat(dto.amount.value.fontSize), weight: .medium)
        valueLabel.text = dto.amount.value.text
        valueLabel.textColor = UIColor(named: dto.amount.value.color)
        
        buildLayout()
    }
    
    private func buildLayout() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        backgroundColor = .clear
        addSubview(backgroundRoundView)
        backgroundRoundView.addSubview(balanceLabel)
        backgroundRoundView.addSubview(valueLabel)
        backgroundRoundView.addSubview(arrowImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundRoundView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundRoundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            backgroundRoundView.heightAnchor.constraint(equalToConstant: 75),
            backgroundRoundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            backgroundRoundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            balanceLabel.topAnchor.constraint(equalTo: backgroundRoundView.topAnchor, constant: 10),
            balanceLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: 10),
            balanceLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -10),
            balanceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            valueLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: backgroundRoundView.leadingAnchor, constant: 10),
            valueLabel.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -10),
            valueLabel.heightAnchor.constraint(equalToConstant: 30),
            
            arrowImage.centerYAnchor.constraint(equalTo: backgroundRoundView.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: backgroundRoundView.trailingAnchor, constant: -5)
        ])
    }
}

