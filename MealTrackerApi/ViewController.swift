//
//  ViewController.swift
//  MealTrackerApi
//
//  Created by ALONSO ALCANTAR on 2/12/19.
//  Copyright © 2019 ALONSO ALCANTAR. All rights reserved.
//

import UIKit
struct Root: Codable {
    let count: Int
    let recipes: [Recipes]
}
struct Count: Codable {
    let count: Int
}
struct Recipes: Codable { //
    let publisher: String
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parse()
    }
    
    func parse() {
        let jsonUrlString = "https://www.food2fork.com/api/search?key=8543ae11b93c5a6f85f2cb49f80c7184"
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else{ return }
            guard let response = response else {return}
            do {
                let recipes = try? JSONDecoder().decode(Root.self, from: data)
                print("Recipe: \(recipes)") // should print the recipe array
//                print("response: \(response)")
//                print("data: \(data)")
            }
            catch let jsonErr{
                print(jsonErr, "error serializing JSON") // catch block that I just added
            }
            }.resume()
        
        //        catFactLabel.text = randomFact
    }
    
}

