//
//  ViewController.swift
//  HeroesApp
//
//  Created by Diogo Moreira on 07/12/20.
//

import UIKit

class ViewController: UIViewController {

    var adapter: HeroDataAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()

        adapter = HeroDataAdapter()
        adapter?.getCharacters(with: 10, and: 1)
    }
}

