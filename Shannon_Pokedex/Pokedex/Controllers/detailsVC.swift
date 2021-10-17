//
//  DetailsVC.swift
//  Pokedex
//
//  Created by Shannon Or on 8/10/21.
//

import UIKit

class DetailsVC: UIViewController {
    //instance of UIViewController for view controller of details (page that pops up when you click on pokemon)
    var pokemon:Pokemon!
    
    private let imageView: UIImageView = {
        let picture = UIImageView()
        picture.contentMode = .scaleAspectFit
        picture.translatesAutoresizingMaskIntoConstraints = false
        return picture
    }()
    
    private let pokemonName: UILabel = {
        let title = UILabel()
        title.textAlignment = .center
        title.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        title.font = UIFont.boldSystemFont(ofSize: 28)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    
    // string array of stats
    private let statLabel: [UILabel] = {
        let details: [String] = ["Attack: ", "Defense: ", "Health: ", "Special Attack: ", "Special Defense: ", "Speed: ", "Total: "]
        //mapping the stuff in details converts them to the format we set for stats, transform them
        return (0...7).map { index in
            let stats = UILabel()
            stats.textAlignment = .center
            stats.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
            stats.font = UIFont.boldSystemFont(ofSize: 18)
            stats.translatesAutoresizingMaskIntoConstraints = false
            return stats
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8790465593, green: 0.9690935016, blue: 1, alpha: 1)
        let url = pokemon?.imageUrlLarge ?? URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/d9/Icon-round-Question_mark.svg")!
        if let data = try? Data(contentsOf: url) {
            imageView.image = UIImage(data: data)
            }
        
        pokemonName.text = "\(pokemon.name) (\(pokemon.id))"
        statLabel[0].text = "Attack: \(pokemon.attack)"
        statLabel[1].text = "Defense: \(pokemon.attack)"
        statLabel[2].text = "Health: \(pokemon.health)"
        statLabel[3].text = "Special Attack: \(pokemon.specialAttack)"
        statLabel[4].text = "Special Defense: \(pokemon.specialDefense)"
        statLabel[5].text = "Speed: \(pokemon.speed)"
        statLabel[6].text = "Total: \(pokemon.total)"
        
        var pokemonType: [String] = []
        // types is a string array because pokemon can have multiple types
        
        //enum introduced and their definition is placed within {} and listed as case. Values defined in an enumeration are its enumeration cases. case keyword introduces new enumeration cases. each pokemon type is an enum case
        
        //matching enumeration values with a switch statement
        //consider the value of pokemon.type. In the case where it equals .Bug, append("Bug") to pokemonType array we created. In the case where it equals .Grass, append("Grass") ... and so on
        //pokemon.types is the enumeration value of the type of this pokemon (?)
        
        for type in pokemon.types {
            switch type {
            case .Bug:
                pokemonType.append("Bug")
            case .Grass:
                pokemonType.append("Grass")
            case .Dark:
                pokemonType.append("Dark")
            case .Ground:
                pokemonType.append("Ground")
            case .Dragon:
                pokemonType.append("Dragon")
            case .Ice:
                pokemonType.append("Ice")
            case .Electric:
                pokemonType.append("Electric")
            case .Normal:
                pokemonType.append("Normal")
            case .Fairy:
                pokemonType.append("Fairy")
            case .Poison:
                pokemonType.append("Poison")
            case .Fighting:
                pokemonType.append("Fighting")
            case .Psychic:
                pokemonType.append("Psychic")
            case .Fire:
                pokemonType.append("Fire")
            case .Rock:
                pokemonType.append("Rock")
            case .Flying:
                pokemonType.append("Flying")
            case .Steel:
                pokemonType.append("Steel")
            case .Ghost:
                pokemonType.append("Ghost")
            case .Water:
                pokemonType.append("Water")
            case .Unknown:
                pokemonType.append("Unknown")
            }
        }
            statLabel[7].text = "Types: \(pokemonType)"
        
        // in order to be able to click on the pokemon and view stats, must assign isActive = true
        // creates a subview for each stat label by looping through all
        for i in 0...7 {
            view.addSubview(statLabel[i])
            statLabel[i].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
            statLabel[i].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        }
        //do this before creating subview for pokemoName and imageView
        
        view.addSubview(pokemonName)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            pokemonName.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            pokemonName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            pokemonName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        
            imageView.topAnchor.constraint(equalTo: pokemonName.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        
            statLabel[0].topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            statLabel[1].topAnchor.constraint(equalTo: statLabel[0].bottomAnchor, constant: 15),
            statLabel[2].topAnchor.constraint(equalTo: statLabel[1].bottomAnchor, constant: 15),
            statLabel[3].topAnchor.constraint(equalTo: statLabel[2].bottomAnchor, constant: 15),
            statLabel[4].topAnchor.constraint(equalTo: statLabel[3].bottomAnchor, constant: 15),
            statLabel[5].topAnchor.constraint(equalTo: statLabel[4].bottomAnchor, constant: 15),
            statLabel[6].topAnchor.constraint(equalTo: statLabel[5].bottomAnchor, constant: 15),
            statLabel[7].topAnchor.constraint(equalTo: statLabel[6].bottomAnchor, constant: 15)
        ])
    }
}
