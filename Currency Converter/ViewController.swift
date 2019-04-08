//
//  ViewController.swift
//  Currency Converter
//
//  Created by Peter Jenkin on 08/04/2019.
//  Copyright © 2019 Peter Jenkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var usaLabel: UILabel!
    @IBOutlet weak var ukLabel: UILabel!
    @IBOutlet weak var canadaLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)      // NB '!' unwrapping
        // clicked - pressing enter &c
    }
    
    // bespoke function to get the kind of currency used by user
    func getCurrency(currency:String)
    {
        //
        let url = URL(string: "http://api.fixer.io/latest/base=\(currency)")
    }

}

