//
//  ViewController.swift
//  Pokedex
//
//  Created by Michael Lin on 2/18/21.
//

import UIKit

class PokedexVC: UIViewController {
    //pokedexVC is an instance of class UIViewController
  
    var pokemons = PokemonGenerator.shared.getPokemonArray()
    //for when filtered we use currentPokemons
    var currentPokemons: [Pokemon]?
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.reuseIdentifier) //add our pokemonCell into collectionviewflowlayout
        return collectionView
    }()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "POKÉDEX"
        label.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let toggleView: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(systemName: "rectangle.grid.2x2"), for: .normal)
        b.imageView?.tintColor = .systemBlue
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    //start with gridview false so it is in rows
    var GridView: Bool = false
    //check if UIButton was clicked
    @objc func didTapToggle(_ sender: UIButton) {
        if GridView {
            GridView = false
        } else {
            GridView = true
        }
        collectionView.performBatchUpdates(nil, completion: nil)
        //this method is for when you want to make multiple changes to the collection view in one single animated operation as opposed to in several operations
    }
    
    var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9219225049, green: 0.9824969172, blue: 1, alpha: 1)
        view.addSubview(mainLabel)//title
        view.addSubview(collectionView) //grids
        view.addSubview(toggleView) //toggle button
        
        //when people tap toggle view
        toggleView.addTarget(self, action: #selector(didTapToggle(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
      
            toggleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            toggleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            toggleView.widthAnchor.constraint(equalTo: toggleView.heightAnchor, constant: 15)
        ])
        
        //frame rectangle for the collection view
        collectionView.frame = view.bounds.inset(by: UIEdgeInsets(top: 230, left: 30, bottom: 0, right: 30))
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsSelection = true
        
        //search bar
        searchBar = UISearchBar.init(frame: .zero)
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        let safeArea = view.safeAreaInsets
        searchBar.frame = CGRect.init(x: view.bounds.width/8, y: safeArea.top + 140, width: view.bounds.width / 5 * 4, height: 30)
        searchBar.tintColor = .blue
        currentPokemons = pokemons
    
        
    }
    
    
}

//data source manages data in collection view, vends info to collection view as needed, creates and configures the cells and supplementary views that collectin view uses to display data
extension PokedexVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentPokemons!.count
    }
    //call this method from data source object when asked toprovide a new cell for the collection view, this dequeues an existing cell if one is available.
    //instead of creating every single cell then selectively displaying them, just create a handful, enough to fill the screen and a little more then as we scroll, we reuse the cells offscreen (save memory)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {        //reuse identifier for specified cell
        let pokemon = currentPokemons?[indexPath.item]      //indexpath specifying location of cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.reuseIdentifier, for: indexPath) as! PokemonCell
        cell.pokemon = pokemon
        return cell
    }
}


//delegate for search bar, modifies and controls the behavior of search bar: in this case, filter pokemons by string
extension PokedexVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentPokemons = pokemons.filter({ p in
            p.name.contains(searchText)
        })
        if currentPokemons?.count == 0 {
            currentPokemons = PokemonGenerator.shared.getPokemonArray()
        }
        
        collectionView.reloadData()
    }
    
    
}
//method that lets you coordinate with a flow layout object to implement a grid based layout
extension PokedexVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if GridView {
            return CGSize(width: view.frame.width / 4, height: view.frame.width / 4)
        } //asks the delegate for the size of the specified item's cell (each pokemon)
        return CGSize(width: 110, height: 120)
    }
    
    //the collection view object that is notifying you of the selection change and the index path of the cell that was selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = currentPokemons?[indexPath.item]
        let details = DetailsVC() //individual page for selected pokemon
        details.pokemon = pokemon
        present(details, animated: true, completion: nil)
    }
}
