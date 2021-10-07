//
//  SFSCollectionCell.swift
//  SFSCollectionCell
//
//  Created by Michael Lin on 9/26/21.
//

import UIKit

class SFSCollectionCell: UICollectionViewCell {
    // TODO: Cell
    static let reuseIdentifier: String = String(describing: SFSCollectionCell)
    
    var symbol: SFSymbol? {
        didSet {
            imageView.image = symbol?.image
            titleView.text = symbol?.name
        }
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = .white
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let titleView: UILabel = {
    let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        contentView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleView)
        // already have padding from the layout hence can use leading anchor
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: titleView.topAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            titleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        //#imageLiteral() #colorLiteral() double click, other, hex color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


