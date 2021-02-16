//
//  PersonAPI.swift
//  Startrivia
//
//  Created by Ethan Fox on 1/26/21.
//

import Foundation
import Alamofire
import SwiftyJSON

// Class responsible for downloading data from the api
class PokemonApi {
    
    // Web request with Alamofire and Codable
//    func getRandomPersonAlamo(id: Int, completion: @escaping PokemonResponseCompletion) {
//        guard let url = URL(string: "\(POKEMON_URL)\(id)") else { return }
//        AF.request(url).responseJSON { (response) in
//            if let error = response.error {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//                return
//            }
//
//            guard let data = response.data else { return completion(nil) }
//            let jsonDecoder = JSONDecoder()
//
//            do {
//                let pokemon = try jsonDecoder.decode(Pokemon.self, from: data)
//                completion(pokemon)
//            }
//
//            catch {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//            }
//        }
//    }
    
    // Web request with Alamofire and SwiftyJSON
    func getRandomPersonAlamo(id: Int, completion: @escaping PokemonResponseCompletion) {

        guard let url = URL(string: "\(POKEMON_URL)\(id)") else { return }
        AF.request(url).responseJSON { (response) in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }

            guard let data = response.data else { return completion(nil) }

            do {
                let json = try JSON(data: data)
                let pokemon = self.parsePokemonSwifty(json: json)
                completion(pokemon)
            }

            catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }


        }
    }
    
    // Web request with Alomofire
//    func getRandomPersonAlamo(id: Int, completion: @escaping PokemonResponseCompletion) {
//
//        guard let url = URL(string: "\(POKEMON_URL)\(id)") else { return }
//        AF.request(url).responseJSON { (response) in
//            if let error = response.error {
//                debugPrint(error.localizedDescription)
//                completion(nil)
//                return
//            }
//
//            guard let json = response.value as? [String: Any] else { return completion(nil) }
//            let pokemon = self.parsePokemonManual(json: json)
//            completion(pokemon)
//        }
//    }
    
    
    // Web request with URL Session
//    func getRandomPersonUrlSession(id: Int, completion: @escaping PokemonResponseCompletion) {
//
//        // Step 3: Give the network request the Url
//        guard let url = URL(string: "\(POKEMON_URL)\(id)") else { return }
//
//        // step 2 continued: initiation of web request taking place.
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard error == nil else {
//                debugPrint(error.debugDescription)
//                completion(nil)
//                return
//            }
//            // Step 4: Get back the data from the web request.
//            guard let data = data else { return }
//
//            // Do/Catch is used when a function has a chance of throwing an error.
//            // Do : Do what you want to do
//            // Step 5: Parse the data using Do/Catch
//            do {
//                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
//                guard let json = jsonAny as? [String : Any] else { return }
//                let pokemon = self.parsePokemonManual(json: json)
//                // Step 6: Once the data is parsed, write the completion. The data 'pokemon' escapes this function and goes back to the VC
//                DispatchQueue.main.async {
//                    completion(pokemon)
//                }
//            }
//            // Catch : Do this if the code in the Do section fails
//            catch {
//                debugPrint(error.localizedDescription)
//                return
//            }
//        }
//        task.resume()
//    }
    
    // Parsing with SwiftyJSON
    private func parsePokemonSwifty(json: JSON) -> Pokemon {

        let name = json["name"].stringValue
        let order = json["id"].stringValue
        let abilities = json["abilities"].arrayValue.map({$0["ability"]["name"].stringValue})
        let height = json["height"].stringValue
        let weight = json["weight"].stringValue
        let heldItems = json["held_items"].stringValue
        let moves = json["moves"].arrayValue.map({$0["move"]["name"].stringValue})
        let types = json["types"].arrayValue.map({$0["type"]["name"].stringValue})

        return Pokemon(name: name, order: order, abilities: abilities, height: height, weight: weight, heldItems: heldItems, moves: moves, types: types)
    }
    
    
    // This is what is called Parsing JSON using manual methods
//    private func parsePokemonManual(json: [String: Any]) -> Pokemon {
//
//        let name = json["name"] as? String ?? ""
//        let order = json["order"] as? Int ?? 0
//        let abilities = json["abilities"] as? [String] ?? [String]()
//        let height = json["height"] as? Int ?? 0
//        let weight = json["weight"] as? Int ?? 0
//        let heldItems = json["held_items"] as? [String] ?? [String]()
//        let moves = json["moves"] as? [String] ?? [String]()
//        let types = json["types"] as? [String] ?? [String]()
//
//        return Pokemon(name: name, order: order, abilities: abilities, height: height, weight: weight, heldItems: heldItems, moves: moves, types: types)
//    }
}
