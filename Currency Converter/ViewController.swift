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
        getCurrency(currency: searchBar.text!)
    }
    
    // bespoke function to get the kind of currency used by user
    func getCurrency(currency:String)
    {
        // e.g. http://api.fixer.io/latest/base=USD
        
        // key d1b90095d0b20832def727c348206e98   - https://github.com/fixerAPI/fixer#readme
        // Request specific exchange rates by setting the symbols parameter.
        //GET /latest?symbols=USD,GBP
        
        let fixerAccessKey = "d1b90095d0b20832def727c348206e98"
        //let url = URL(string: "http://api.fixer.io/latest/base=\(currency)?access_key=/(fixerAccessKey)")     // deprecated

        let url = URL(string: "http://data.fixer.io/api/latest?base=\(currency)&access_key=\(fixerAccessKey)")
        print(url!)
        
        // NB http not liked, https only allowed by default
        // Add Row -
        // 'App Transport security settings' - select and 'Add Row again'  Allow Arbitrary Loads to 'Yes' in Info.plist
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!)
            {(data, response, error) in
            
                if error != nil
                {
                    let alert = UIAlertController(title:"Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler:nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
            }
            else    // if all's ok, no error
            {
                
                do
                {
                    let jSONResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, AnyObject>
                    // from API docs, some fields arrays not strings, so use AnyObject
                    if data != nil
                    {
                        DispatchQueue.main.async {      // NB asynchronously DispatchQueue.main.async
                            print(jSONResult)
                        }
                    }

                } catch
                {
                    
                
                }
                
            }
        }
        task.resume()       // start task actually
    }

}

