//
//  pokemonCell.swift
//  Pokedex
//
//  Created by Shannon Or on 8/10/21.
//

import UIKit

class PokemonCell: UICollectionViewCell {
  //create nameIDView as an instnace of UILabel
    private let nameIDView: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .boldSystemFont(ofSize: 12) 
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let picture = UIImageView()
        picture.contentMode = .scaleAspectFit //stretch this image up as large as it can go
        picture.translatesAutoresizingMaskIntoConstraints = false
        return picture
    }()
    
    
    
    static let reuseIdentifier: String = String(describing: PokemonCell.self)
    //instance of the cell created with constant type property
    //String(describing:) prints type name
    //reuseIdentifier associated with view cell object that the view delegate creates with the intent to use it as the basis for mulitple rows
    
    //pokemon optional type
    // didSet is a property observer that allows you to execute code whenever a property has changed: use didSet to execute code when a property has been set 
    var pokemon: Pokemon? {
        didSet {
            
            //?? is a nil-coalescing operator that unwraps optional pokemon if it contains a vlaue or returns default "" (default that we chose) if pokemon is nil (default chosen must be of the same type as optional value we try to unwrap
            let name: String = pokemon?.name ?? ""
            let id: Int = pokemon?.id ?? 0
            nameIDView.text = "\(name) (\(id))"
            //nameID is the UILabel, assigning the text of the UI label to properties we get from pokemon
            
            
            let url = pokemon?.imageUrlLarge ?? URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/d9/Icon-round-Question_mark.svg")!
            //let stringLink = link?.absoluteString //absoluteString converts optional url into string property
            //if let url: URL = URL(string: (stringLink)!)
            if let data = try? Data(contentsOf: url) {
                //initializes a data object with data from the location speified by a given URL
                imageView.image = UIImage(data: data)
                    //assigns image to that data
                }
        }
    }
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //content view is for the cell
        contentView.addSubview(imageView)
        contentView.addSubview(nameIDView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameIDView.topAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            nameIDView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameIDView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameIDView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
