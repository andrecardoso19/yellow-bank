//
//  GenericSectionCell.swift
//  YellowBank
//
//  Created by André  Aragão on 18/03/25.
//
import UIKit

final class GenericSectionCell: UITableViewCell {
    static let reuseId = "GenericSectionCell"
    private var dto: GenericSectionCellDTO
    
//    private lazy var backgroundRoundView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 5
//        return view
//    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: CGFloat(dto.title.fontSize), weight: .medium)
        titleLabel.text = dto.title.text
        titleLabel.textColor = UIColor(named: dto.title.color)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: CGFloat(dto.subtitle.fontSize), weight: .medium)
        titleLabel.text = dto.subtitle.text
        titleLabel.textColor = UIColor(named: dto.subtitle.color)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "arrow.right"))
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, dto: GenericSectionCellDTO) {
        self.dto = dto
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        buildLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    private func buildLayout() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(arrowImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            subTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            arrowImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
}

extension GenericSectionCell {
    struct GenericSectionCellDTO {
        let title: HomeTitle
        let subtitle: HomeTitle
    }
}
