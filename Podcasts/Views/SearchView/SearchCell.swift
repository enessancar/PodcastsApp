//
//  SearchTableViewCell.swift
//  Podcasts
//
//  Created by Enes Sancar on 6.05.2023.
//

import UIKit
import Kingfisher

class SearchCell: UITableViewCell {
    static let identifier = "SearchTableViewCell"
    
    //MARK: - Properties
    var result: Result? {
        didSet {
            configure()
        }
    }
    
    private let appIconImageView = IconImageView(height: 64, width: 64, cornerRadius: 12)
    private let trackName = BodyLabel(text: "track name", fontSize: 18, weight: .regular)
    private let artistName = BodyLabel(text: "artist", fontSize: 16, weight: .medium)
    private var labelStackView: UIStackView!
    private var overalStackView: UIStackView!
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension SearchCell {
    private func setup() {
        trackName.numberOfLines = 0
        artistName.numberOfLines = 0
        
        labelStackView = UIStackView(arrangedSubviews: [trackName, artistName])
        labelStackView.axis = .vertical
        labelStackView.spacing = 8
        
        overalStackView = UIStackView(arrangedSubviews: [appIconImageView, labelStackView])
        overalStackView.axis = .horizontal
        overalStackView.spacing = 12
        overalStackView.alignment = .center
        overalStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(overalStackView)
        
        NSLayoutConstraint.activate([
            overalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            overalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            overalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            overalStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func configure() {
        guard let result = result else {
            return
        }
        let viewModel = SearchCellViewModel(result: result)
        trackName.text = viewModel.trackName
        artistName.text = viewModel.artistName
        appIconImageView.kf.setImage(with: viewModel.podcastImage)
    }
}
