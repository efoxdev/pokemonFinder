//
//  ViewController.swift
//  Startrivia
//
//  Created by Ethan Fox on 12/29/20.
//

import UIKit

class SelectPersonVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var orderLbl: UILabel!
    @IBOutlet weak var typesLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var abilitiesLbl: UILabel!
    @IBOutlet weak var movesLbl: UILabel!
    @IBOutlet weak var gamesBtn: UIButton!
    @IBOutlet weak var berriesBtn: UIButton!
    @IBOutlet weak var typesBtn: UIButton!
    @IBOutlet weak var regionsBtn: UIButton!
    
    
    // Step 1: initialize an instance of the PokemonApi in the View Controller.
    var pokemonApi = PokemonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // step 2: Call getRandomPersonUrlSession which initiates a web request
        // The data from step 6 'pokemon', is passed into the Completion Handler below
        
        
        
    }

    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1 ... 898)
        pokemonApi.getRandomPersonAlamo(id: random) { (pokemon) in
                    if let pokemon = pokemon {
                        // Step 7: Do what you want with the data.
                        self.nameLbl.text = pokemon.name
                        self.orderLbl.text = pokemon.order.description
                        self.heightLbl.text = pokemon.height.description
                        self.weightLbl.text = pokemon.weight.description
                        self.abilitiesLbl.text = pokemon.abilities.description
                        self.typesLbl.text = pokemon.types.description
                        self.movesLbl.text = pokemon.moves.description
                    }
                }
    }
    
    @IBAction func gamesClicked(_ sender: Any) {
    }
    
    @IBAction func berriesClicked(_ sender: Any) {
    }
    
    @IBAction func typesClicked(_ sender: Any) {
    }
    
    @IBAction func regionClicked(_ sender: Any) {
    }
    
}

